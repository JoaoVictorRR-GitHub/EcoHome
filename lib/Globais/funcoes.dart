import 'package:flutter/material.dart';
import 'fontes_estilos.dart';



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