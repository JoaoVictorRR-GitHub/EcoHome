import 'package:flutter/material.dart';

import 'package:eco_home/main.dart';
import 'Globais/fontes_estilos.dart';



/// ###### Clase de topicos.
class Topicos {
  final Widget pagina;  // Pagina do topico.
  final String titulo;  // Titulo do topico.
  final Icon icone;     // Icone do topico.

  Topicos(this.pagina, this.titulo, this.icone);
}

/// ###### Lista de assuntos da pagina home.
// List<Topicos> listaAssuntos = [
//   Topicos(const MyHomePage(), 'SOBRE O APLICATIVO', const Icon(Icons.info_rounded, color: verdeThemeII)),
//   Topicos(const MyHomePage(), 'COMO USAR',          const Icon(Icons.app_shortcut_rounded, color: amareloTheme)),
//   Topicos(const MyHomePage(), 'CONFIGURAÇÕES',      const Icon(Icons.settings_applications_rounded, color: Colors.teal)),
//   Topicos(const MyHomePage(), 'Assunto', const Icon(Icons.abc_rounded, color: Colors.blue)),
//   Topicos(const MyHomePage(), 'Assunto', const Icon(Icons.abc_rounded, color: Colors.blue)),
//   Topicos(const MyHomePage(), 'Assunto', const Icon(Icons.abc_rounded, color: Colors.blue)),
// ];





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
                  Icon(Icons.info_rounded, color: verdeThemeII),
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





/*
GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 20,
      //padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.1),
      children: List.generate(
        listaAssuntos.length,
        (index) {
          return InkWell(
            highlightColor: verdeThemeI,  // Cor quando  o card eh pressionado.
            customBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            onTap: () {
              // Redirecionamento para a pagina do topico quando clicado.
              Navigator.push(context, MaterialPageRoute(builder: (context) => listaAssuntos[index].pagina));
            },
            child: Card(
              //elevation: 50,
              shape: const OutlineInputBorder(borderSide: BorderSide(color: verdeThemeI,  strokeAlign: 2, width: 2, style: BorderStyle.solid)),
              color: kabulTheme,
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    listaAssuntos[index].icone,
                    const Padding(padding: EdgeInsets.only(top: 10)),
                    Text(listaAssuntos[index].titulo, style: const TextStyle(color: fundoColor, fontSize: 15, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
* */