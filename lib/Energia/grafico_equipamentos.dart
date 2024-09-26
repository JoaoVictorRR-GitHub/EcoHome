import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../Equipamentos/definicao_equipamento.dart';



/// ###### Gráfico de porcentagem dos equipamentos no sistema.
class GraficoEquipamentos extends StatefulWidget {
  /// ###### Gráfico de porcentagem dos equipamentos no sistema.
  const GraficoEquipamentos({super.key, this.graficoConsumo = false});

  /// Indica se o gráfico vai exibir a porcetagem de
  /// consumo de energia ao invés da porcentagem do
  /// número de equipamentos no sistema.
  final bool graficoConsumo;

  @override
  State<GraficoEquipamentos> createState() => _GraficoEquipamentosState();
}

class _GraficoEquipamentosState extends State<GraficoEquipamentos> {

  int sectionTouchIndex = 0;  // Indice da fatia selecionada no grafico.

  @override
  Widget build(BuildContext context) {
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

            double porcentagemFatia = 0;  // Porcentagem da fatia.

            // Quantidade do tipo de equipamento no sistema.
            int qntTipo = equipamentos.where(
                  (element) { return element.tipo == tipos.entries.elementAt(index).key; },
            ).length;

            // Configuracao do grafico de tipo e de consumo.
            if(widget.graficoConsumo == false){
              porcentagemFatia = ((qntTipo * 100) / equipamentos.length); // Porcentagem do tipo de equipamento no sistema.
            }
            else{
              double consumoTipo = 0.0;   // Consumo geral do tipo de equipamento.
              double consumoTotal = 0.1;  // Consumo total dos equipamentos.

              // Calculo do consumo total.
              for(var element in equipamentos){
                consumoTotal += element.consumoEnergia;
                consumoTotal -= element.geracaoEnergia;
              }

              // Calculo do consumo geral do tipo de equipamento.
              equipamentos.where((element) {
                return (element.tipo == tipos.entries.elementAt(index).key);
              }).forEach((element) => (consumoTipo += element.consumoEnergia));

              // Porcentagem do consumo de energia.
              porcentagemFatia = ((consumoTipo * 100) / consumoTotal).abs();
            }

            Icon icone = tipos[TipoEnum.values.elementAt(index)]!['icone'];
            final bool isTouched = (index == sectionTouchIndex);                    // Indica se a fatia foi selecionada.
            final double textScale    = (porcentagemFatia/(!isTouched ? 20 : 18));  // Escala da fonte do texto (Padrao/Selecionado).
            final double fontSize     = (textScale * 16.0).clamp(12, 22);           // Fonte do texto (Padrao/Selecionado).
            final double iconeScale   = !isTouched ? 1.3 : 1.7;                     // Escala do icone (Padrao/Selecionado).
            final double radiusFatia  = !isTouched ? 100.0 : 110.0;                 // Preenchimento da fatia (Padrao/Selecionado).
            final double radiusAvatar = !isTouched ? 30.0 : 36.0;                   // Preenchimento do avatar do icone (Padrao/Selecionado).
            final Color? corAvatar    = !isTouched ? Colors.white30 : Colors.cyanAccent[80];  // Cor de fundo do avatar do icone (Padrao/Selecionado).

            return PieChartSectionData(
              color: icone.color,                 // Cor da fatia.
              radius: radiusFatia,                // Preenchimento da fatia.
              value:  porcentagemFatia,           // Porcentagem da fatia.
              titlePositionPercentageOffset: .45, // Alinhamento do titulo.
              badgePositionPercentageOffset: .98, // Alinhamento do avatar do icone.
              title: '${porcentagemFatia.toStringAsFixed(0)}%\n($qntTipo)', // Titulo.
              borderSide: BorderSide(width: !isTouched ? 1 : 2, color: Colors.black45),
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
  }
}