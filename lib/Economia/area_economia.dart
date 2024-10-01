import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';

import 'definicao_gasto.dart';
import '../Globais/funcoes.dart';
import '../Globais/fontes_estilos.dart';



/// ###### Área para visualizar dados sobre os gastos com o consumo de energia dos equipamentos.
class PaginaEconomia extends StatefulWidget {
  /// ###### Área para visualizar dados sobre os gastos com o consumo de energia dos equipamentos.
  const PaginaEconomia({super.key});

  @override
  State<PaginaEconomia> createState() => _PaginaEconomiaState();
}

class _PaginaEconomiaState extends State<PaginaEconomia> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 150.0),
        child: GraficoEconomia(),
      ),
    );
  }
}






class GraficoEconomia extends StatefulWidget {
  const GraficoEconomia({super.key});

  @override
  State<GraficoEconomia> createState() => _GraficoEconomiaState();
}

class _GraficoEconomiaState extends State<GraficoEconomia> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerModel>(
      builder: (BuildContext context, timerModel, Widget? child) {

        // Limites do eixo Y.
        double maxGasto = gastos.isNotEmpty ? gastos.fold<double>(0.0003, (max, g) => g.gasto > max ? g.gasto : max) : 0.0003;
        double minGasto = gastos.isNotEmpty ? gastos.fold<double>(-0.00005, (min, g) => g.gasto < min ? g.gasto : min) : -0.00005;

        // Margens do eixo Y.
        double margemSuperior = (maxGasto - minGasto) * 0.1;  // 10% de margem para a parte superior.
        double margemInferior = (maxGasto - minGasto) * 0.1;  // 10% de margem para a parte inferior.

        return LineChart(
          LineChartData(
            clipData: const FlClipData.all(),   // Configura a exibicao dos pontos nos limites do grafico.
            maxY: (maxGasto + margemSuperior),
            minY: (minGasto - margemInferior),
            backgroundColor: Colors.teal[100],
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
                  interval: ((maxGasto - minGasto) / 2),
                  getTitlesWidget: (value, meta) => Text(NumberFormat('0.0E0').format(value), style: styleTextoNormal), // Formatacao dos dados em notacao cientifica.
                ),
              ),
              // Titulo inferior.
              bottomTitles: AxisTitles(
                axisNameSize: 25,
                axisNameWidget: const Text('Tempo', style: styleTextoPadrao),
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, meta) {
                    int seconds = value.toInt();
                    int minutes = (seconds ~/ 60);
                    int remainingSeconds = (seconds % 60);

                    if (minutes > 0) {
                      return Text('${minutes}m${remainingSeconds}s', style: const TextStyle(color: Colors.black, fontSize: 10));  // Exibe o tempo em formato (m) e (s).
                    } else {
                      return Text('${seconds}s', style: const TextStyle(color: Colors.black, fontSize: 10));  // Exibe o tempo em formato (s).
                    }
                  },
                ),
              ),
            ),
            gridData: FlGridData( // Configuracao do grid.
              show: true,
              drawVerticalLine: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(strokeWidth: (value == 0) ? 2 : 1, color: (value == 0) ? Colors.red : Colors.grey.withOpacity(0.5));
              },
              getDrawingVerticalLine: (value) {
                return FlLine(strokeWidth: 1, color: Colors.grey.withOpacity(0.5));
              },
            ),
            lineBarsData: [ // Configuracao do grafico.
              LineChartBarData(
                barWidth: 5,
                isCurved: true,
                color: Colors.blue,
                isStrokeCapRound: true,
                dotData: FlDotData( // Configuracao dos pontos.
                  show: true,
                  getDotPainter: (spot, percent, bar, index) => FlDotCirclePainter(radius: 5, strokeWidth: 2, color: Colors.blue, strokeColor: Colors.white),
                ),
                spots: List.generate( // Configuracao dos dados.
                  gastos.length,
                  (index) => FlSpot(gastos[index].tempoAtual, gastos[index].gasto),
                ),
                belowBarData: BarAreaData(  // Style do grafico.
                  show: true,
                  gradient: LinearGradient(
                    colors: [
                      Colors.blue.withOpacity(0.3),
                      Colors.green.withOpacity(0.3),
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
                getTooltipColor: (spot) => Colors.blueGrey.withOpacity(0.8),
                tooltipBorder: const BorderSide(color: Colors.blue, width: 2),
              ),
            ),
          ),
        );
      }
    );
  }
}