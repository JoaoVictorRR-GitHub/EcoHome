import 'package:flutter/material.dart';

import 'package:eco_home/main.dart';
import 'Globais/fontes_estilos.dart';



/// ###### Área da página inicial.
class AreaHome extends StatefulWidget {
  /// ###### Área da página inicial.
  const AreaHome({super.key});

  @override
  State<AreaHome> createState() => _AreaHomeState();
}

class _AreaHomeState extends State<AreaHome> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: [
              WidgetSpan(child: Text('BEM VINDO', style: styleTextoSelecionado, textScaler: TextScaler.linear(3))),
              WidgetSpan(child: Text('AO SEU ESPAÇO ECOHOME', style: styleTextoSelecionado, textScaler: TextScaler.linear(1.5))),
            ],
          ),
        ),
        InkWell(
          highlightColor: verdeThemeI,  // Cor quando  o card eh pressionado.
          customBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          onTap: () {
            // Redirecionamento para a pagina do topico quando clicado.
            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage()));
          },
          child: const Card(
            //elevation: 50,
            shape: OutlineInputBorder(borderSide: BorderSide(color: verdeThemeI,  strokeAlign: 2, width: 2, style: BorderStyle.solid)),
            color: kabulTheme,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.info_rounded, color: fundoColor),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text('SOBRE O APLICATIVO', style: TextStyle(color: fundoColor, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ),
        // const Text(
        //   '© 2024 JV Tech e Desenvolvimentos.\nTodos os direitos reservados.\n\n'
        //       'Visite minha página GitHub:\nhttps://github.com/JoaoVictorRR-GitHub',
        //   textAlign: TextAlign.center,
        //   style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5),
        // ),
        GestureDetector(
          onTap: () {},  // print("Link clicado!");
          child: RichText(
            textAlign: TextAlign.center,
            text: const TextSpan(
              style: TextStyle(fontSize: 14, color: Colors.black54, height: 1.5),
              children: [
                TextSpan(text: '© 2024 JV Tech e Desenvolvimentos.\nTodos os direitos reservados.\n\n'),
                TextSpan(text: 'Visite minha página GitHub:\n'),
                TextSpan(text: 'https://github.com/JoaoVictorRR-GitHub', style: TextStyle(fontSize: 14, color: Colors.blue, decoration: TextDecoration.underline)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}