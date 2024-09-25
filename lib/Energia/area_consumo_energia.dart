import 'package:flutter/material.dart';

import 'grafico_equipamentos.dart';
import '../Globais/fontes_estilos.dart';

enum Graficos {graficoTipo, graficoExtra}



/// ###### Área para visualizar dados sobre o consumo de energia dos equipamentos.
class AreaConsumoEnergia extends StatefulWidget {
  /// ###### Área para visualizar dados sobre o consumo de energia dos equipamentos.
  const AreaConsumoEnergia({super.key});

  @override
  State<AreaConsumoEnergia> createState() => _AreaConsumoEnergiaState();
}

class _AreaConsumoEnergiaState extends State<AreaConsumoEnergia> {


  Graficos graficosIndex = Graficos.graficoTipo;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () { setState(() { graficosIndex = Graficos.graficoTipo; }); },
              style: ButtonStyle(
                elevation:        const WidgetStatePropertyAll(10),
                backgroundColor:  const WidgetStatePropertyAll(verdeThemeI),
                overlayColor:     const WidgetStatePropertyAll(verdeThemeII),
                padding:          const WidgetStatePropertyAll(EdgeInsets.all(20)),
                shape:            WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: borderRadius10)),
              ),
              icon:   const Icon(Icons.ad_units_rounded, color: Colors.pink),
              label:  const Text('TIPOS (%)', style: styleBotoesConfirmacao),
            ),
            ElevatedButton.icon(
              onPressed: () { setState(() { graficosIndex = Graficos.graficoExtra; }); },
              style: ButtonStyle(
                elevation:        const WidgetStatePropertyAll(10),
                backgroundColor:  const WidgetStatePropertyAll(kabulTheme),
                overlayColor:     const WidgetStatePropertyAll(fundoColor),
                padding:          const WidgetStatePropertyAll(EdgeInsets.all(20)),
                shape:            WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: borderRadius10)),
              ),
              icon:   const Icon(Icons.ad_units_rounded, color: Colors.pink),
              label:  const Text('CONSUMO (%)', style: styleBotoesConfirmacao),
            ),
          ],
        ),
        Expanded(
          child: (graficosIndex == Graficos.graficoTipo) ? const GraficoEquipamentos() : Container(),
        ),
      ],
    );
  }
}