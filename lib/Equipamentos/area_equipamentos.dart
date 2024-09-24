import 'package:flutter/material.dart';

import '../Globais/funcoes.dart';
import 'definicao_equipamento.dart';
import 'formulario_equipamento.dart';
import '../Globais/fontes_estilos.dart';



/// ###### Área para adição e visualização dos equipamentos no sistema.
class AreaEquipamentos extends StatefulWidget {
  /// ###### Área para adição e visualização dos equipamentos no sistema.
  const AreaEquipamentos({super.key});

  @override
  State<AreaEquipamentos> createState() => _AreaEquipamentosState();
}

class _AreaEquipamentosState extends State<AreaEquipamentos> {

  /// Função para exibir a área de formulário para
  /// adicionar um novo equipamento no sistema.
  Future<void> adicionarEquipamento() async {
    await showDialog(context: context, builder: (context) => const FormularioEquipamento());
    setState(() {});
  }

  /// Função para remover um equipamento do sistema.
  Future<void> removerEquipamento(int index) async {
    if(await mensagemConfirmacao(context, 'Remover Equipamento', 'Deseja realmente remover este equipamento ?')){
      setState(() { equipamentos.remove(equipamentos[index]); });
      if(mounted) await mensagemAviso(context, 'Operação Conclúida', 'O equipamento foi removido com sucesso !');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilledButton.icon(
          onPressed:() async { await adicionarEquipamento(); },
          style: ButtonStyle(
            iconColor: const WidgetStatePropertyAll(verdeThemeII),
            overlayColor: const WidgetStatePropertyAll(verdeThemeII),
            backgroundColor: const WidgetStatePropertyAll(verdeThemeI),
            textStyle: const WidgetStatePropertyAll(styleBotoesConfirmacao),
            fixedSize: WidgetStatePropertyAll(Size(MediaQuery.of(context).size.width, 50)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: borderRadius10)),
          ),
          icon: const Icon(Icons.add_circle_rounded),
          label: const Text('ADICIONAR EQUIPAMENTO'),
        ),
        espacamentoV,
        Expanded(
          child: ListView.builder(
            itemCount: equipamentos.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Card(  // Corrige um problema do layout: (https://github.com/flutter/flutter/issues/86584) (usar Material no ListView tamberm resolve).
                  child: ListTile(
                    shape: OutlineInputBorder(borderRadius: borderRadius10, borderSide: const BorderSide(color: verdeThemeI, width: 2)),
                    titleTextStyle: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold, height: 2),
                    tileColor: Colors.white60,
                    horizontalTitleGap: 25,
                    dense:    true,
                    leading:  tipos[equipamentos[index].tipo]!['icone'],
                    title:    Text(equipamentos[index].nome),
                    subtitle: Text(tipos[equipamentos[index].tipo]!['nome'] +'\n' +equipamentos[index].marca +'\n' +equipamentos[index].modelo, style: const TextStyle(color: Colors.black, fontSize: 10)),
                    trailing: IconButton(
                      onPressed: () async { await removerEquipamento(index); },
                      icon: const Icon(Icons.remove_circle_rounded, color: Colors.red),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}