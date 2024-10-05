import 'package:flutter/material.dart';
import 'Globais/fontes_estilos.dart';



/// ###### Área de informações sobre a aplicação.
class InfoApp {

  /// Contexto da página.
  BuildContext context;

  /// Construtor da classe.
  InfoApp(this.context);

  /// Método para desenhar uma área de artigo.
  Container customAreaArtigo(String titulo, String conteudo){
    return Container(
      margin: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Text(titulo, style: styleTextoPadrao, textScaler: const TextScaler.linear(1.3)),
          Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: borderRadius10,
              color: verdeThemeII.withOpacity(0.2),
              border: Border.all(width: 2, color: verdeThemeI),
            ),
            child: Text(conteudo, style: styleTextoPadrao.copyWith(fontWeight: FontWeight.normal), textScaler: const TextScaler.linear(1)),
          ),
        ],
      ),
    );
  }

  /// Método para exibir as informações sobre a aplicação.
  void exibirInfo(){
    showAboutDialog(
      context: context,
      applicationName: 'EcoHome',
      applicationVersion: '1.0.0',
      barrierColor: verdeThemeI.withOpacity(0.6),
      applicationIcon: Image.asset('imagens/Logo - Sem Fundo.png', width: MediaQuery.of(context).size.width/4),
      applicationLegalese: '© 2024 JV Tech e Desenvolvimentos.\nTodos os direitos reservados.\n\nVisite minha página GitHub:\nhttps://github.com/JoaoVictorRR-GitHub',
      children: [
        customAreaArtigo(
          'ÁREA DE CONSUMO',
          'A área de consumo apresenta uma visão geral da porcentagem de equipamentos '
              'de um mesmo tipo presente no sistema e a porcentagem de consumo geral '
              'por cada tipo de equipamento.',
        ),
        customAreaArtigo(
          'ÁREA DE ECONOMIA',
          'A área de economia exibe um gráfico que atualiza periodicamente os gastos '
              'totais, em reais (R\$), calculados a partir do consumo e da geração de '
              'energia dos equipamentos ao longo do tempo.',
        ),
        customAreaArtigo(
          'ÁREA DE EQUIPAMENTOS',
          'Essa área exibe os equipamentos adicionados ao sistema e apresenta uma ferramenta '
              'para adicionar novos equipamentos e removê-los.',
        ),
        customAreaArtigo(
          'DESENVOLVIMENTO',
          'Essa aplicação foi desenvolvida como parte de um projeto para a feira de ciências '
              'e seu intuito é única e exclusivamente o de simular o consumo energético e '
              'a gestão econômica de recursos numa residência.',
        ),
      ],
    );
  }
}