import 'dart:math';
import 'dart:async';
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

  Timer? _timer;  // Temporizador.
  GraficosEnergia graficosIndex = GraficosEnergia.porcentagemTipos; // Indice do grafico exibido.

  @override
  void initState() {
    simularConsumo();
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }


  /// Método para simular o consumo de energia dos equipamentos.
  void simularConsumo(){

    const double baseConsumo = 6.0;         // Base do consumo de energia.
    const double baseGeracao = 5.0;         // Base da geracao de energia.
    const intervalo = Duration(seconds: 5); // Intervalo entre cada ciclo.

    // Simulacao da geracao/cosumo de energia.
    _timer = Timer.periodic(intervalo, (Timer timer) {
      if(equipamentos.isNotEmpty) {
        setState(() {
          int randIndex = Random().nextInt(equipamentos.length);  // Gera um indice aleatorio.

          // Verificacao de equipamentos que geram energia mais não consomem.
          if(equipamentos[randIndex].tipo == TipoEnum.painelSolar){
            equipamentos[randIndex].geracaoEnergia = Random().nextDouble() * baseGeracao;
          } else{
            equipamentos[randIndex].consumoEnergia = Random().nextDouble() * baseConsumo;
          }
        });
      }
    });
  }


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
                padding:          const WidgetStatePropertyAll(EdgeInsets.all(20)),
                shape:            WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: borderRadius10)),
              ),
              icon:   const Icon(Icons.ad_units_rounded, color: Colors.pink),
              label:  const Text('EQUIPAMENTOS (%)', style: styleBotoesConfirmacao, textScaler: TextScaler.linear(0.8)),
            ),
            ElevatedButton.icon(
              onPressed: () { setState(() { graficosIndex = GraficosEnergia.porcentagemConsumo; }); },
              style: ButtonStyle(
                elevation:        const WidgetStatePropertyAll(10),
                backgroundColor:  const WidgetStatePropertyAll(kabulTheme),
                overlayColor:     const WidgetStatePropertyAll(fundoColor),
                padding:          const WidgetStatePropertyAll(EdgeInsets.all(20)),
                shape:            WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: borderRadius10)),
              ),
              icon:   const Icon(Icons.ad_units_rounded, color: Colors.pink),
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