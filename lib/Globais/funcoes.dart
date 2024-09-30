import 'dart:async';
import 'dart:math';

import 'fontes_estilos.dart';
import 'package:flutter/material.dart';
import '../Economia/definicao_gasto.dart';
import '../Equipamentos/definicao_equipamento.dart';



/// ###### Função para exibir uma mensagem de confirmação no sistema.
Future<bool> mensagemConfirmacao(BuildContext context, String titulo, String conteudo) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(titulo, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        content: Text(conteudo, style: const TextStyle(fontSize: 18)),
        actions: [
          TextButton(
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(verdeThemeI), overlayColor: WidgetStatePropertyAll(verdeThemeII)),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('SIM', style: styleBotoesConfirmacao),
          ),
          TextButton(
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red), overlayColor: WidgetStatePropertyAll(laranjaTheme)),
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('NÃO', style: styleBotoesConfirmacao),
          ),
        ],
      );
    },
  ) ?? false;
}

/// ###### Função para exibir uma mensagem de aviso no sistema.
Future<void> mensagemAviso(BuildContext context, String titulo, String conteudo) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(titulo, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        content: Text(conteudo, style: const TextStyle(fontSize: 18)),
        actions: [
          TextButton(
            style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(verdeThemeI), overlayColor: WidgetStatePropertyAll(verdeThemeII)),
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: styleBotoesConfirmacao),
          ),
        ],
      );
    },
  );
}


/// ###### Classe de temporizador para executar funções no sistema.
class TimerModel with ChangeNotifier {

  Timer? timer; // Temporizador.

  /// Método para simular o consumo de energia dos equipamentos.
  void simularConsumo() {
    double energiaAcumulada = 0.0;            // Energia acumulada do consumo/geracao de energia.
    const double baseConsumo = 60.0;          // Base do consumo de energia (W).
    const double baseGeracao = 50.0;          // Base da geracao de energia (W).
    const intervalo = Duration(seconds: 10);  // Intervalo entre cada ciclo.

    // Simulacao da geracao/cosumo de energia (W).
    timer = Timer.periodic(intervalo, (Timer timer) {
      if(equipamentos.isNotEmpty) {

        double energiaTotal = 0.0;
        int tempoAtual = timer.tick * intervalo.inSeconds;  // Tempo total (s) desde o início.

        // Loop para simular o consumo/geracao de energia dos equipamentos.
        for(Equipamento element in equipamentos){

          // Verificacao de equipamentos que geram energia mais não consomem.
          if(element.tipo == TipoEnum.painelSolar){
            element.geracaoEnergia = Random().nextDouble() * baseGeracao;
            energiaTotal -= element.geracaoEnergia; // Credito.
          } else{
            element.consumoEnergia = Random().nextDouble() * baseConsumo;
            energiaTotal += element.consumoEnergia; // Consumo.
          }
        }

        energiaAcumulada += energiaTotal; // Acumulo da energia no tempo.

        // Verificacao para otimizar o grafico de gastos.
        if(gastos.length == 10){
          gastos.add(Gasto(energiaAcumulada, tempoAtual.toDouble(), 11 * intervalo.inSeconds)); // Adiciona os gastos acumulados (11).
          gastos.removeRange(0, gastos.length - 1); // Remove os gastos anteriores.
          energiaAcumulada = 0.0;                   // Reseta a energia acumulada.
        }
        else{
          gastos.add(Gasto(energiaTotal, tempoAtual.toDouble(), intervalo.inSeconds));  // Adiciona o gasto de cada ciclo na lista.
        }

        notifyListeners();  // Atualiza o State das paginas para exibir a alteracao nos graficos.
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}