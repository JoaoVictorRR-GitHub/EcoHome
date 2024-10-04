import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



/// Estilo de arredondamento para as bordas.
final BorderRadius borderRadius10 = BorderRadius.circular(10);

/// Espacamento vertical entre widgets.
const Padding espacamentoV = Padding(padding: EdgeInsets.symmetric(vertical: 10));

/// Filtro de texto para campos de formulario.
final TextInputFormatter filtroApenasTexto = FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'));

/// Widget padrão para quando o não existem equipamentos no sistema.
final Center widgetEquipamentoVazio = Center(
  child: Container(
    height: 150,
    padding: const EdgeInsets.all(20),
    alignment: Alignment.center,
    decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('imagens/Logo - Sem Fundo.png'), opacity: 0.6, scale: 0.2)),
    child: const Text("ADICIONE EQUIPAMENTOS PARA GERENCIAR SUA CASA!", style: styleTextoPadrao2, textAlign: TextAlign.center),
  ),
);


// Cores tematicas do sistema.
const Color headerColor  = Color.fromRGBO(196, 188, 172, 1);
const Color fundoColor   = Color.fromRGBO(246, 249, 244, 1);
const Color verdeThemeI  = Color.fromRGBO( 42,  75,  52, 1);
const Color verdeThemeII = Color.fromRGBO(116, 156,  74, 1);
const Color kabulTheme   = Color.fromRGBO(100,  84,  68, 1);

const Color amareloClaro    = Color.fromRGBO(253, 226, 147, 1); // #FDE293
const Color amareloDourado  = Color.fromRGBO(249, 199, 79,  1); // #F9C74F
const Color amareloMostarda = Color.fromRGBO(212, 160, 21,  1); // #D4A015
const Color laranjaClaro    = Color.fromRGBO(247, 141, 101, 1); // #F78D65
const Color laranjaTheme    = Color.fromRGBO(244, 124, 34,  1); // #F47C22 - laranjaQueimado.
const Color laranjaProfundo = Color.fromRGBO(217, 100, 44,  1); // #D9642C

const Color cinzaClaro  = Color.fromRGBO(225, 225, 225, 1);  // #E1E1E1
const Color begeClaro   = Color.fromRGBO(222, 215, 197, 1);  // #DED7C5
const Color marromSuave = Color.fromRGBO(139, 106, 70,  1);  // #8B6A46

// const Color laranjaTheme = Color.fromRGBO(255, 159, 28, 1);
const Color amareloTheme = Color.fromRGBO(227, 181, 5, 1);


// Offsets e sombras dos textos.
/// Offset(3, 2)
const Offset offsetsI   = Offset(3, 2);
/// Offset(-3, 2)
const Offset offsetsII  = Offset(-3, 2);
/// Offset(0, 3)
const Offset offsetsIII = Offset(0, 3);
/// Offset(0, -3)
const Offset offsetsIV  = Offset(0, -3);
const Shadow sombraPadraoI  = Shadow(color: Colors.black, offset: offsetsI);
const Shadow sombraPadraoII = Shadow(color: Colors.white54, offset: Offset(2, 2));


// Estilos de texto do sistema.
const TextStyle styleTextoNormal          = TextStyle(fontSize: 15, color: Colors.black);
const TextStyle styleTextoPadrao          = TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);
const TextStyle styleTextoPadrao2         = TextStyle(fontSize: 14, color: fundoColor, fontWeight: FontWeight.bold);
const TextStyle styleBotoesConfirmacao    = TextStyle(color: fundoColor, fontWeight: FontWeight.bold);
const TextStyle styleTextoSelecionado     = TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold, shadows: [Shadow(color: verdeThemeII, offset: offsetsI)]);
const TextStyle styleTextoNaoSelecionado  = TextStyle(fontSize: 12, color: verdeThemeI,  fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.black38, offset: Offset(2, 2))]);

const TextStyle styleTextoSelecionado2    = TextStyle(fontSize: 12, color: fundoColor,  fontWeight: FontWeight.w700, shadows: [Shadow(color: verdeThemeII, offset: offsetsI)]);
const TextStyle styleTextoNaoSelecionado2 = TextStyle(fontSize: 10, color: verdeThemeI, fontWeight: FontWeight.w400, shadows: [Shadow(color: Colors.black38, offset: Offset(1, 1))]);
