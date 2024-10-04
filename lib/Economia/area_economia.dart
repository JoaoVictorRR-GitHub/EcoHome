import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'definicao_gasto.dart';
import '../Globais/funcoes.dart';
import 'grafico_gastos_consumo.dart';
import '../Globais/fontes_estilos.dart';



/// ###### Área para visualizar dados sobre os gastos com o consumo de energia dos equipamentos.
class AreaEconomia extends StatefulWidget {
  /// ###### Área para visualizar dados sobre os gastos com o consumo de energia dos equipamentos.
  const AreaEconomia({super.key});

  @override
  State<AreaEconomia> createState() => _AreaEconomiaState();
}

class _AreaEconomiaState extends State<AreaEconomia> {

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerModel>(
        builder: (BuildContext context, timerModel, Widget? child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('GASTO TOTAL',
              textAlign: TextAlign.center,
              textScaler: TextScaler.linear(1.5),
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black, shadows: [Shadow(color: Colors.white54, offset: offsetsI)]),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(borderRadius: borderRadius10),  // color: Colors.grey[200]),
              child: Text(
                NumberFormat.simpleCurrency(locale: 'pt_BR', decimalDigits: 5).format(gastoTotal),
                style: const TextStyle(fontSize: 20, color: verdeThemeI, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            espacamentoV,
            espacamentoV,
            const Expanded(child: GraficoGastoConsumo(),),
          ],
        );
      }
    );
  }
}