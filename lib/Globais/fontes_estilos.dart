import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



/// Estilo de arredondamento para as bordas.
final BorderRadius borderRadius10 = BorderRadius.circular(10);

/// Espacamento vertical entre widgets.
const Padding espacamentoV = Padding(padding: EdgeInsets.symmetric(vertical: 10));

/// Filtro de texto para campos de formulario.
final TextInputFormatter filtroApenasTexto = FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]'));


// Cores tematicas do sistema.
const Color headerColor  = Color.fromRGBO(196, 188, 172, 1);
const Color fundoColor   = Color.fromRGBO(246, 249, 244, 1);
const Color verdeThemeI  = Color.fromRGBO( 42,  75,  52, 1);
const Color verdeThemeII = Color.fromRGBO(116, 156,  74, 1);
const Color kabulTheme   = Color.fromRGBO(100,  84,  68, 1);

const Color laranjaTheme = Color.fromRGBO(255, 159, 28, 1);
const Color amareloTheme = Color.fromRGBO(227, 181, 5, 1);


// Offsets e sombras dos textos.
const Offset offsetsI    = Offset(3, 2);
const Offset offsetsII   = Offset(-3, 2);
const Shadow sombraPadraoI  = Shadow(color: Colors.black, offset: offsetsI);
const Shadow sombraPadraoII = Shadow(color: Colors.white54, offset: Offset(2, 2));


// Estilos de texto do sistema.
const TextStyle styleTextoNormal          = TextStyle(fontSize: 12, color: Colors.black);
const TextStyle styleTextoPadrao          = TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold);
const TextStyle styleBotoesConfirmacao    = TextStyle(color: fundoColor, fontWeight: FontWeight.bold);
const TextStyle styleTextoSelecionado     = TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold, shadows: [Shadow(color: verdeThemeII, offset: offsetsI)]);
const TextStyle styleTextoNaoSelecionado  = TextStyle(fontSize: 12, color: verdeThemeI,  fontWeight: FontWeight.bold, shadows: [Shadow(color: Colors.black38, offset: Offset(2, 2))]);
