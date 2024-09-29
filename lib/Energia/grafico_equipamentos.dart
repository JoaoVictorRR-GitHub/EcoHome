import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import '../Globais/funcoes.dart';
import '../Equipamentos/definicao_equipamento.dart';



/// ###### Gráfico de porcentagem dos equipamentos no sistema.
class GraficoEquipamentos extends StatefulWidget {
  /// ###### Gráfico de porcentagem dos equipamentos no sistema.
  const GraficoEquipamentos({super.key, this.graficoEquipamentos = false});

  /// Indica se o gráfico vai exibir a porcetagem de equipamentos
  /// do mesmo tipo no sistema ao invés da porcentagem do consumo
  /// de energia dos equipamentos.
  final bool graficoEquipamentos;

  @override
  State<GraficoEquipamentos> createState() => _GraficoEquipamentosState();
}

class _GraficoEquipamentosState extends State<GraficoEquipamentos> {

  int sectionTouchIndex = 0;  // Indice da fatia selecionada no grafico.


  /// Método para calcular a quantidade de equipamentos do mesmo tipo.
  int quantidadeEquipamentos(int index){
    return equipamentos.where((element) {
      return (element.tipo == tipos.entries.elementAt(index).key);
    }).length;
  }

  /// Método para calcular o consumo de energia total
  /// (líquido) de todos os equipamentos no sistema.
  double calculoConsumoTotal(){
    double consumoTotal = 0.01; // Consumo total de energia dos equipamentos.

    // Calculo do consumo liquido total.
    for(Equipamento element in equipamentos){
      consumoTotal += element.consumoEnergia;
      consumoTotal -= element.geracaoEnergia;
    }

    return consumoTotal;
  }

  /// Método para calcular o consumo de energia total
  /// (líquido) de um tipo de equipamento no sistema.
  double calculoConsumoTipo(int index){
    double consumoTipo = 0.0; // Consumo total de energia do tipo de equipamento.

    // Calculo do consumo liquido do tipo de equipamento.
    equipamentos.where((element) {
      return (element.tipo == tipos.entries.elementAt(index).key);
    }).forEach((element) {
      consumoTipo += element.consumoEnergia;
      consumoTipo -= element.geracaoEnergia;
    });

    return consumoTipo;
  }

  /// Método para calcular as porcentagens de consumo/geração
  /// de nergia dos equipamentos ou a porcentagem dos tipos
  /// de equipamentos no sistema.
  double calcularPorcentagens(int index){
    if(widget.graficoEquipamentos){
      return ((quantidadeEquipamentos(index) * 100) / equipamentos.length);
    } else {
      return ((calculoConsumoTipo(index) * 100) / calculoConsumoTotal());
    }
  }

  /// Método para calcular a porcentagem da fatia que será
  /// exibida no gráfico para cada tipo de equipamento.
  double calcularFatia(double porcentagem){
    double fatiaMinima = 10;  // Porcentagem minima da fatia para exibir no grafico.

    // if(widget.graficoEquipamentos) { return porcentagem; }
    // Verificacao para garantir que os equipamentos tenham uma fatia mínima visível.
    if (porcentagem <= (2 * fatiaMinima)) { return fatiaMinima; }
    else { return (porcentagem - fatiaMinima); }
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<TimerModel>(
      builder: (BuildContext context, timerModel, Widget? child) {
        return PieChart(
          PieChartData(
            sectionsSpace: 10,      // Espacamento entre as fatias.
            centerSpaceRadius: 30,  // Preenchimento central do grafico.
            pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                setState(() {
                  // Verificacao de toque nas fatias.
                  if(!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                    sectionTouchIndex = -1;
                    return;
                  }
                  sectionTouchIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                });
              },
            ),
            sections: List.generate(
              TipoEnum.values.length,
              (index) {

                double porcentagens     = calcularPorcentagens(index);  // Porcentagem do consumo de energia ou dos tipos de equipamentos.
                double porcentagemFatia = calcularFatia(porcentagens);  // Porcentagem da fatia do tipo de equipamento no grafico.

                Icon icone = tipos[TipoEnum.values.elementAt(index)]!['icone'];
                final bool isTouched = (index == sectionTouchIndex);                    // Indica se a fatia foi selecionada.
                final double textScale    = (porcentagemFatia/(!isTouched ? 20 : 18));  // Escala da fonte do texto (Padrao/Selecionado).
                final double fontSize     = (textScale * 16.0).clamp(12, 22);           // Fonte do texto (Padrao/Selecionado).
                final double iconeScale   = !isTouched ? 1.3 : 1.7;                     // Escala do icone (Padrao/Selecionado).
                final double radiusFatia  = !isTouched ? 100.0 : 110.0;                 // Preenchimento da fatia (Padrao/Selecionado).
                final double radiusAvatar = !isTouched ? 30.0 : 36.0;                   // Preenchimento do avatar do icone (Padrao/Selecionado).
                final Color? corAvatar    = !isTouched ? Colors.white30 : Colors.cyanAccent[80];  // Cor de fundo do avatar do icone (Padrao/Selecionado).

                return PieChartSectionData(
                  color:  icone.color,                // Cor da fatia.
                  radius: radiusFatia,                // Preenchimento da fatia.
                  value:  porcentagemFatia,           // Porcentagem da fatia.
                  titlePositionPercentageOffset: .45, // Alinhamento do titulo.
                  badgePositionPercentageOffset: .98, // Alinhamento do avatar do icone.
                  borderSide: BorderSide(width: !isTouched ? 1 : 2, color: Colors.black45),
                  title: '${porcentagens.toStringAsFixed(0)}%\n(${quantidadeEquipamentos(index)})', // Titulo.
                  titleStyle: TextStyle(fontSize: fontSize, color: Colors.black, fontWeight: !isTouched ? FontWeight.normal : FontWeight.bold),
                  badgeWidget: Container(
                    decoration: ShapeDecoration(shape: CircleBorder(side: BorderSide(color: icone.color!, width: !isTouched ? 1 : 3))),
                    child: CircleAvatar(
                      radius: radiusAvatar,
                      backgroundColor: corAvatar,
                      child: Transform.scale(scale: iconeScale, child: icone),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}