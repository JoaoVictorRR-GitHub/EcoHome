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
    const double baseConsumo = 6.0;         // Base do consumo de energia.
    const double baseGeracao = 5.0;         // Base da geracao de energia.
    const intervalo = Duration(seconds: 5); // Intervalo entre cada ciclo.

    // Simulacao da geracao/cosumo de energia (W).
    timer = Timer.periodic(intervalo, (Timer timer) {
      if(equipamentos.isNotEmpty) {

        // Todo: gerar para todos de uma vez?
        Gasto gasto;                                            // Gasto com o consumo/geracao de energia (R$).
        int tempoAtual = timer.tick * intervalo.inSeconds;      // Tempo total em segundos desde o início
        int randIndex = Random().nextInt(equipamentos.length);  // Gera um indice aleatorio.

        // Verificacao de equipamentos que geram energia mais não consomem.
        if(equipamentos[randIndex].tipo == TipoEnum.painelSolar){
          equipamentos[randIndex].geracaoEnergia = Random().nextDouble() * baseGeracao;
          gasto = Gasto(-equipamentos[randIndex].geracaoEnergia, tempoAtual, intervalo.inSeconds);
        } else{
          equipamentos[randIndex].consumoEnergia = Random().nextDouble() * baseConsumo;
          gasto = Gasto(equipamentos[randIndex].consumoEnergia, tempoAtual, intervalo.inSeconds);
        }

        gastos.add(gasto);  // Adiciona o gasto na lista.
        notifyListeners();  // Atualiza o State das páginas para exibir a alteração nos graficos.
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}