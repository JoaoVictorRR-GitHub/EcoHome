import 'package:flutter/material.dart';

import 'pagina_home.dart';
import 'Globais/funcoes.dart';
import 'Globais/fontes_estilos.dart';
import 'Economia/area_economia.dart';
import 'Energia/area_consumo_energia.dart';
import 'Equipamentos/area_equipamentos.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}



/// ###### Página inicial.
class MyHomePage extends StatefulWidget {
  /// ###### Página inicial.
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var _paginaIndex = 0;
  final List _paginas = [
    {'pagina': const AreaHome(),            'titulo': "INÍCIO",              'corTema': fundoColor},
    {'pagina': const AreaConsumoEnergia(),  'titulo': "CONSUMO DE ENERGIA",  'corTema': verdeThemeI},
    {'pagina': const PaginaEconomia(),        'titulo': "ECONOMIA",            'corTema': laranjaTheme},
    {'pagina': const AreaEquipamentos(),    'titulo': "EQUIPAMENTOS",        'corTema': kabulTheme},
  ];


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        didPop = await mensagemConfirmacao(context, 'Sair da Aplicação', 'Deseja realmente sair da aplicação ?');
        result = didPop;
        if(didPop && context.mounted) Navigator.pop(context);
      },
      child: DefaultTabController(
        initialIndex: 0,
        length: _paginas.length,
        child: Scaffold(
          appBar: AppBar(
            elevation: 10,
            toolbarHeight: 90,  // Altura da area do titulo.
            centerTitle: true,
            leadingWidth: 100,  // Largura do logo.
            shadowColor: verdeThemeI,
            backgroundColor: headerColor,
            leading: Image.asset('imagens/Logo - Sem Fundo.png'),
            title: RichText(
              //textAlign: TextAlign.center,
              textScaler: const TextScaler.linear(0.7),
              text: const TextSpan(
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, letterSpacing: 2, height: 1.5),
                children: [
                  TextSpan(text: 'Eco',   style: TextStyle(color: Colors.white, shadows: [Shadow(color: verdeThemeI,  offset: offsetsII)])),
                  TextSpan(text: 'Home',  style: TextStyle(color: verdeThemeI,  shadows: [Shadow(color: fundoColor,   offset: offsetsII)])),
                  TextSpan(text: '\nVocê no controle da sua casa\n', style: TextStyle(color: Colors.black, fontSize: 15)),
                ],
              ),
            ),
          ),
          backgroundColor: _paginas[_paginaIndex]['corTema'],
          body: TabBarView(
            children: List.generate(_paginas.length, (index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.06,
                    decoration: const BoxDecoration(
                      color:        headerColor,
                      borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                      boxShadow:    [BoxShadow(color: verdeThemeI, offset: Offset(0, 3), spreadRadius: 3)],
                    ),
                    child: Text(
                      _paginas[index]["titulo"],
                      style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold, shadows: [Shadow(color: verdeThemeII, offset: offsetsI)]),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.1),
                      child: _paginas[index]['pagina'],
                    ),
                  ),
                ],
              );
            }),
          ),
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color:        headerColor,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow:    [BoxShadow(color: verdeThemeI, offset: Offset(0, -3), spreadRadius: 3)],
            ),
            child: TabBar(
              onTap: (value) {
                setState(() { _paginaIndex = value; });
              },
              tabAlignment: TabAlignment.fill,
              labelPadding: const EdgeInsets.all(1),
              labelStyle:   styleTextoSelecionado,            // Estilo da fonte do texto no tab selecionado.
              textScaler:   const TextScaler.linear(0.7),     // Escala do texto.
              unselectedLabelStyle: styleTextoNaoSelecionado, // Estilo da fonte do texto nos tabs nao selecionados.
              indicatorSize:    TabBarIndicatorSize.tab,      // Largura do indicador no tab selecionado.
              indicatorPadding: const EdgeInsets.only(top: 40),
              indicator:        const BoxDecoration(color: kabulTheme, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              tabs: const [
                Tab(text: "HOME",         icon: Icon(Icons.house_rounded,               color: verdeThemeII,  shadows: [Shadow(color: Colors.black54, offset: offsetsI)]), iconMargin: EdgeInsets.only(bottom: 10)),
                Tab(text: "CONSUMO",      icon: Icon(Icons.energy_savings_leaf_rounded, color: verdeThemeI,   shadows: [Shadow(color: amareloTheme,   offset: offsetsI)]), iconMargin: EdgeInsets.only(bottom: 10)),
                Tab(text: "ECONOMIA",     icon: Icon(Icons.eco_rounded,                 color: laranjaTheme,  shadows: [Shadow(color: Colors.black,   offset: offsetsI)]), iconMargin: EdgeInsets.only(bottom: 10)),
                Tab(text: "EQUIPAMENTO",  icon: Icon(Icons.control_camera_rounded,      color: Colors.white,  shadows: [Shadow(color: verdeThemeI,    offset: offsetsI)]), iconMargin: EdgeInsets.only(bottom: 10)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}