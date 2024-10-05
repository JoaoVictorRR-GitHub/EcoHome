import 'package:flutter/material.dart';

import 'grafico_equipamentos.dart';
import '../Globais/fontes_estilos.dart';
import '../Equipamentos/definicao_equipamento.dart';

/// Tipos de graficos de consumo de energia.
enum GraficosEnergia {porcentagemTipos, porcentagemConsumo}



/// ###### Área para visualizar dados sobre o consumo de energia dos equipamentos.
class AreaConsumoEnergia extends StatefulWidget {
  /// ###### Área para visualizar dados sobre o consumo de energia dos equipamentos.
  const AreaConsumoEnergia({super.key});

  @override
  State<AreaConsumoEnergia> createState() => _AreaConsumoEnergiaState();
}

class _AreaConsumoEnergiaState extends State<AreaConsumoEnergia> {

  GraficosEnergia graficosIndex = GraficosEnergia.porcentagemTipos; // Indice do grafico exibido.


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () { setState(() { graficosIndex = GraficosEnergia.porcentagemTipos; }); },
              style: ButtonStyle(
                elevation:        const WidgetStatePropertyAll(10),
                backgroundColor:  const WidgetStatePropertyAll(verdeThemeI),
                overlayColor:     const WidgetStatePropertyAll(verdeThemeII),
                padding:          const WidgetStatePropertyAll(EdgeInsets.all(14)),
                shape:            WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: borderRadius10)),
              ),
              icon:   const Icon(Icons.ad_units_rounded, color: Colors.pink),
              label:  const Text('EQUIPAMENTOS (%)', style: styleBotoesConfirmacao, textScaler: TextScaler.linear(0.8)),
            ),
            ElevatedButton.icon(
              onPressed: () { setState(() { graficosIndex = GraficosEnergia.porcentagemConsumo; }); },
              style: ButtonStyle(
                elevation:        const WidgetStatePropertyAll(10),
                backgroundColor:  const WidgetStatePropertyAll(laranjaTheme),
                overlayColor:     const WidgetStatePropertyAll(Colors.orangeAccent),
                padding:          const WidgetStatePropertyAll(EdgeInsets.all(14)),
                shape:            WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: borderRadius10)),
              ),
              icon:   const Icon(Icons.power_rounded, color: verdeThemeI),  // Icons.timelapse_rounded.
              label:  const Text('CONSUMO (%)', style: styleBotoesConfirmacao, textScaler: TextScaler.linear(0.8)),
            ),
          ],
        ),
        Expanded(
          child: (equipamentos.isEmpty) ? widgetEquipamentoVazio
              : GraficoEquipamentos(graficoEquipamentos: (graficosIndex == GraficosEnergia.porcentagemTipos)),
        ),
      ],
    );
  }
}