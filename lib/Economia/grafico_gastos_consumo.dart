import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import 'definicao_gasto.dart';
import '../Globais/funcoes.dart';
import '../Globais/fontes_estilos.dart';



/// ###### Gráfico dos gastos gerais com o consumo e a geração de energia dos equipamentos no sistema.
class GraficoGastoConsumo extends StatefulWidget {
  /// ###### Gráfico dos gastos gerais com o consumo e a geração de energia dos equipamentos no sistema.
  const GraficoGastoConsumo({super.key});

  @override
  State<GraficoGastoConsumo> createState() => _GraficoGastoConsumoState();
}

class _GraficoGastoConsumoState extends State<GraficoGastoConsumo> {

  // Limites do eixo Y.
  late double maxGasto;
  late double minGasto;

  /// Método para calcular os limites do eixo Y no gráfico.
  void calcularLimitesEixoY(){

    // Calculo dos limites do eixo Y.
    maxGasto = gastos.isNotEmpty ? gastos.fold<double>(0.0003, (max, g) => g.gasto > max ? g.gasto : max) : 0.0003;
    minGasto = gastos.isNotEmpty ? gastos.fold<double>(-0.00005, (min, g) => g.gasto < min ? g.gasto : min) : -0.00005;

    // Margens do eixo Y.
    double margemSuperior = (maxGasto - minGasto) * 0.1;  // 10% de margem para a parte superior.
    double margemInferior = (maxGasto - minGasto) * 0.15; // 15% de margem para a parte inferior.

    maxGasto += margemSuperior;
    minGasto -= margemInferior;
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<TimerModel>(
        builder: (BuildContext context, timerModel, Widget? child) {

          calcularLimitesEixoY();

          return LineChart(
            LineChartData(
              clipData: const FlClipData.all(),   // Configura a exibicao dos pontos nos limites do grafico.
              maxY: maxGasto,
              minY: minGasto,
              backgroundColor: Colors.grey[200],
              titlesData: FlTitlesData(           // Configuracao dos titulos.
                // Titulo do topo.
                topTitles: const AxisTitles(),
                // Titulo da esquerda.
                leftTitles: const AxisTitles(axisNameSize: 30, axisNameWidget: Text('Consumo de Energia (R\$)', style: styleTextoPadrao)),
                // Titulo da direita.
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 40,
                    interval: ((maxGasto - minGasto) / 2),  // Intervalo de exibicao do eixo Y.
                    getTitlesWidget: (value, meta) => Text(NumberFormat('0.0E0').format(value), style: styleTextoNormal), // Formatacao dos dados em notacao cientifica.
                  ),
                ),
                // Titulo inferior.
                bottomTitles: AxisTitles(
                  axisNameSize: 25,
                  axisNameWidget: const Text('Tempo', style: styleTextoPadrao),
                  sideTitles: SideTitles(
                    interval: 10, // Intervalo de exibicao do eixo X.
                    showTitles: true,
                    getTitlesWidget: (value, meta) {

                      String displayTime;
                      int totalSeconds = value.toInt();

                      // Calculo para exibir o tempo.
                      if (totalSeconds >= 3600) {
                        // 1 hora ou mais.
                        int hours = totalSeconds ~/ 3600;
                        int minutes = (totalSeconds % 3600) ~/ 60;
                        displayTime = '${hours}h${minutes}m';
                      } else if (totalSeconds >= 60) {
                        // Menos de 1 hora, mas mais de 1 minuto.
                        int minutes = totalSeconds ~/ 60;
                        int seconds = totalSeconds % 60;
                        displayTime = '${minutes}m${seconds}s';
                      } else {
                        displayTime = '${totalSeconds}s'; // Menos de 1 minuto.
                      }

                      return Text(displayTime, style: const TextStyle(color: Colors.black, fontSize: 10));
                    },
                  ),
                ),
              ),
              gridData: FlGridData( // Configuracao do grid.
                show: true,
                drawVerticalLine: true,
                getDrawingHorizontalLine: (value) { // Cor das linhas horizontais do grid.
                  return FlLine(strokeWidth: (value == 0) ? 2 : 1, color: (value == 0) ? Colors.red : Colors.grey.withOpacity(0.5));
                },
                getDrawingVerticalLine: (value) { // Cor das linhas verticais do grid.
                  return FlLine(strokeWidth: 1, color: Colors.grey.withOpacity(0.5));
                },
              ),
              lineBarsData: [ // Configuracao do grafico.
                LineChartBarData(
                  barWidth: 5,
                  isCurved: true,
                  color: verdeThemeI, // Colors.blue,
                  isStrokeCapRound: true,
                  dotData: FlDotData( // Configuracao dos pontos.
                    show: true,
                    getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(radius: 5, strokeWidth: 2, color: verdeThemeI, strokeColor: Colors.white),
                  ),
                  spots: List.generate( // Configuracao dos dados.
                    gastos.length,
                        (index) => FlSpot(gastos[index].tempoAtual, gastos[index].gasto),
                  ),
                  belowBarData: BarAreaData(  // Style do grafico.
                    show: true,
                    gradient: LinearGradient(
                      colors: [
                        verdeThemeI.withOpacity(0.3),
                        verdeThemeII.withOpacity(0.3),
                        // Colors.blue.withOpacity(0.3),
                        // Colors.green.withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
              ],
              lineTouchData: LineTouchData( // Configuracao de interacoes no grafico.
                handleBuiltInTouches: true,
                touchTooltipData: LineTouchTooltipData(
                  tooltipRoundedRadius: 8,
                  fitInsideVertically: true,
                  fitInsideHorizontally: true,
                  tooltipPadding: const EdgeInsets.all(8),
                  getTooltipColor: (spot) => Colors.grey.withOpacity(0.8),
                  tooltipBorder: const BorderSide(color: verdeThemeI, width: 2),
                  getTooltipItems: (List<LineBarSpot> spots) {  // Style de exibicao do valor no ponto.
                    return spots.map((LineBarSpot spot) {
                      return LineTooltipItem('Valor: ${spot.y.toStringAsPrecision(5)}', styleTextoSelecionado);
                    }).toList();
                  },
                ),
              ),
            ),
          );
        }
    );
  }
}