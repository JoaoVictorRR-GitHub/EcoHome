import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'pagina_home.dart';
import 'Globais/funcoes.dart';
import 'Globais/fontes_estilos.dart';
import 'Economia/area_economia.dart';
import 'Energia/area_consumo_energia.dart';
import 'Equipamentos/area_equipamentos.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TimerModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoHome',
      theme: ThemeData(
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

  /// Indice da área selecionada.
  var _areaIndex = 0;

  /// Lista do conteúdo de cada área.
  final List _conteudoAreas = [
    {'pagina': const AreaHome(),            'titulo': "INÍCIO",              'corTema': begeClaro},
    {'pagina': const AreaConsumoEnergia(),  'titulo': "CONSUMO DE ENERGIA",  'corTema': verdeThemeII},
    {'pagina': const AreaEconomia(),        'titulo': "ECONOMIA",            'corTema': fundoColor},
    {'pagina': const AreaEquipamentos(),    'titulo': "EQUIPAMENTOS",        'corTema': begeClaro},
  ];


  @override
  void initState() {
    Provider.of<TimerModel>(context, listen: false).simularConsumo();
    super.initState();
  }

  @override
  void dispose() {
    Provider.of<TimerModel>(context, listen: false).dispose();
    super.dispose();
  }

  /// Método para desenhar o área do título de cada área da aplicação.
  PreferredSize areaTitulo(){
    double altura = 50; // MediaQuery.of(context).size.height * 0.06,

    return PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width, altura),
      child: Container(
        height: altura,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color:        headerColor,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          boxShadow:    [
            BoxShadow(color: verdeThemeI, offset: offsetsIII, spreadRadius: 3),
            BoxShadow(color: verdeThemeI, offset: offsetsIV, spreadRadius: 2),
          ],
        ),
        child: Text(
          _conteudoAreas[_areaIndex]["titulo"], // Titulo de cada area.
          style: styleTextoSelecionado.copyWith(fontSize: 20),
        ),
      ),
    );
  }

  /// Método para desenhar a parte de navegação entre as áreas da aplicação.
  Container areaNavegacao(){
    return Container(
      height: 70,
      decoration: const BoxDecoration(
        color:        headerColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        border:       Border(top: BorderSide(width: 3, color: verdeThemeI)),
        boxShadow:    [BoxShadow(color: verdeThemeI, offset: offsetsIV, spreadRadius: 3)],
      ),
      child: BottomNavigationBar(
        elevation: 15,
        onTap: (index) {
          setState(() { _areaIndex = index; });
        },
        currentIndex: _areaIndex,
        showUnselectedLabels: true,                       // Indica se o texto dos itens não selecionados sera exibido.
        useLegacyColorScheme: false,                      // Indica se as cores padrao serao utilizadas.
        backgroundColor: headerColor,                     // Nota: So funciona com type fixed.
        type: BottomNavigationBarType.fixed,              // Estilo dos itens.
        selectedLabelStyle:   styleTextoSelecionado2,     // Estilo da fonte do texto no tab selecionado.
        unselectedLabelStyle: styleTextoNaoSelecionado2,  // Estilo da fonte do texto nos tabs nao selecionados.
        items: const [  // Areas da aplicacao.
          BottomNavigationBarItem(backgroundColor: Colors.red, label: "HOME",         icon: Icon(Icons.house_rounded,               color: verdeThemeII,  shadows: [Shadow(color: Colors.black54, offset: offsetsI)])),
          BottomNavigationBarItem(backgroundColor: headerColor, label: "CONSUMO",      icon: Icon(Icons.energy_savings_leaf_rounded, color: verdeThemeI,   shadows: [Shadow(color: amareloTheme,   offset: offsetsI)])),
          BottomNavigationBarItem(backgroundColor: headerColor, label: "ECONOMIA",     icon: Icon(Icons.eco_rounded,                 color: laranjaTheme,  shadows: [Shadow(color: Colors.black,   offset: offsetsI)])),
          BottomNavigationBarItem(backgroundColor: headerColor, label: "EQUIPAMENTO",  icon: Icon(Icons.control_camera_rounded,      color: Colors.white,  shadows: [Shadow(color: verdeThemeI,    offset: offsetsI)])),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if(didPop) return;
        if(await mensagemConfirmacao(context, 'Sair da Aplicação', 'Deseja realmente sair da aplicação ?')) SystemNavigator.pop();
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 15,
          toolbarHeight: 80,  // Altura da area do titulo.
          centerTitle: true,
          leadingWidth: 100,  // Largura do logo.
          shadowColor: amareloDourado,
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
                TextSpan(text: '\nVocê no controle da sua casa\n', style: styleTextoNormal),
              ],
            ),
          ),
          bottom: areaTitulo(), // Area do  titutlo de cada pagina.
        ),
        backgroundColor: _conteudoAreas[_areaIndex]['corTema'], // Cor do fundo de cada area.
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: MediaQuery.of(context).size.height * 0.1),
          child: _conteudoAreas[_areaIndex]['pagina'],  // Conteudo de cada area.
        ),
        bottomNavigationBar: areaNavegacao(), // Navegacao entre as areas.
      ),
    );
  }
}