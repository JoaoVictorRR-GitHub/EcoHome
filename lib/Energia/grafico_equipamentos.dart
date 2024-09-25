import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../Globais/fontes_estilos.dart';
import '../Equipamentos/definicao_equipamento.dart';



/// ###### Gráfico de porcentagem dos tipos de equipamento no sistema.
class GraficoEquipamentos extends StatefulWidget {
  /// ###### Gráfico de porcentagem dos tipos de equipamento no sistema.
  const GraficoEquipamentos({super.key});

  @override
  State<GraficoEquipamentos> createState() => _GraficoEquipamentosState();
}

class _GraficoEquipamentosState extends State<GraficoEquipamentos> {

  int sectionTouchIndex = 0;  // Indice da fatia selecionada no grafico.

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 0,       // Espacamento entre as fatias.
        centerSpaceRadius: 30,  // Preenchimento central do grafico.
        borderData: FlBorderData(show: true),
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

            // Quantidade do tipo de equipamento no sistema.
            int qntTipo = equipamentos.where((element) {
              return element.tipo == tipos.entries.elementAt(index).key;
            }).length;
            double porcentagemTipo = (qntTipo / TipoEnum.values.length) * 100;  // Porcentagem do tipo de equipamento no sistema.

            Icon icone = tipos[TipoEnum.values.elementAt(index)]!['icone'];
            final isTouched = (index == sectionTouchIndex); // Indica se a fatia foi selecionada.
            final fontSize      = !isTouched ? 16.0 : 20.0;   // Fonte do texto (Padrao/Selecionado).
            final iconeScale    = !isTouched ? 1.3 : 1.7;     // Escala do icone (Padrao/Selecionado).
            final radiusFatia   = !isTouched ? 100.0 : 110.0; // Preenchimento da fatia (Padrao/Selecionado).
            final radiusAvatar  = !isTouched ? 30.0 : 36.0;   // Preenchimento do avatar do icone (Padrao/Selecionado).
            final corAvatar = !isTouched ? Colors.black26 : fundoColor; // Cor de fundo do avatar do icone (Padrao/Selecionado).

            return PieChartSectionData(
              color: icone.color,                     // Cor da fatia.
              radius: radiusFatia,                    // Preenchimento da fatia.
              value:  porcentagemTipo,                // Porcentagem da fatia.
              titlePositionPercentageOffset: .40,     // Alinhamento do titulo.
              badgePositionPercentageOffset: .98,     // Alinhamento do avatar do icone.
              title: '$porcentagemTipo%\n($qntTipo)', // Titulo.
              titleStyle: TextStyle(fontSize: fontSize, color: Colors.black, fontWeight: FontWeight.bold),
              badgeWidget: Container(
                decoration: const ShapeDecoration(shape: CircleBorder(side: BorderSide(color: verdeThemeI, width: 3))),
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