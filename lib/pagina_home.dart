import 'package:flutter/material.dart';

import 'Globais/fontes_estilos.dart';
import 'package:eco_home/main.dart';



/// ###### Clase de topicos.
class Topicos {
  final Widget pagina;  // Pagina do topico.
  final String titulo;  // Titulo do topico.
  final Icon icone;     // Icone do topico.

  Topicos(this.pagina, this.titulo, this.icone);
}

/// ###### Lista de assuntos da pagina home.
List<Topicos> listaAssuntos = [
  Topicos(const MyHomePage(), 'SOBRE O APLICATIVO', const Icon(Icons.info_rounded, color: verdeThemeII)),
  Topicos(const MyHomePage(), 'COMO USAR',          const Icon(Icons.app_shortcut_rounded, color: amareloTheme)),
  Topicos(const MyHomePage(), 'CONFIGURAÇÕES',      const Icon(Icons.settings_applications_rounded, color: Colors.teal)),
  Topicos(const MyHomePage(), 'Assunto', const Icon(Icons.abc_rounded, color: Colors.blue)),
  Topicos(const MyHomePage(), 'Assunto', const Icon(Icons.abc_rounded, color: Colors.blue)),
  Topicos(const MyHomePage(), 'Assunto', const Icon(Icons.abc_rounded, color: Colors.blue)),
];





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
    return GridView.count(
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
  }
}