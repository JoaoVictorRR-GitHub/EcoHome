import 'package:flutter/material.dart';

import '../Globais/funcoes.dart';
import 'definicao_equipamento.dart';
import '../Globais/fontes_estilos.dart';



/// ###### Área de formulário para adicionar um novo equipamento ao sistema EcoHome.
class FormularioEquipamento extends StatefulWidget {
  /// ###### Área de formulário para adicionar um novo equipamento ao sistema EcoHome.
  const FormularioEquipamento({super.key});

  @override
  State<FormularioEquipamento> createState() => _FormularioEquipamentoState();
}

class _FormularioEquipamentoState extends State<FormularioEquipamento> {

  Equipamento novoEquipamento = Equipamento();  // Novo equipamento.
  final keyFormulario = GlobalKey<FormState>(); // Chave mestre do formulario.
  String mensagemCampoVazio = "O campo não pode estar vazio!";  // Mensagem para os campos vazios.


  /// Método para retornar um estilo de decoração default para os campos do formulário.
  InputDecoration textFormDecoration(String titulo, Icon? icone){
    return InputDecoration(
      filled:                 true,                           // Habilita as cores do "fillColor".
      fillColor:              fundoColor,
      isDense:                true,
      suffixIcon:             icone,                          // Icone.
      labelText:              titulo,                         // Nome do campo.
      labelStyle:             styleTextoPadrao,               // Estilo do nome do campo.
      floatingLabelAlignment: FloatingLabelAlignment.center,  // Alinhamento do nome do campo.
      border:         OutlineInputBorder(borderSide: const BorderSide(color: verdeThemeI),      borderRadius: borderRadius10),
      errorBorder:    OutlineInputBorder(borderSide: const BorderSide(color: Colors.pink),      borderRadius: borderRadius10),
      enabledBorder:  OutlineInputBorder(borderSide: const BorderSide(color: Colors.blueGrey),  borderRadius: borderRadius10),
      errorStyle:     const TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
    );
  }

  /// Método para retornar um campo de formulário TextFormField.
  TextFormField campoFormulario(String titulo, Icon? icone){
    return TextFormField(
      validator: (value) { return (value!.isEmpty) ? mensagemCampoVazio : null; },
      onSaved: (newValue) {
        // Salvamento dos dados no evento save do Form.
        newValue = newValue!.toUpperCase();
        if(titulo == 'Nome') novoEquipamento.nome = newValue;
        if(titulo == 'Marca') novoEquipamento.marca = newValue;
        if(titulo == 'Modelo') novoEquipamento.modelo = newValue;
      },
      style:            styleTextoNormal,                   // Estilo do texto do campo.
      keyboardType:     TextInputType.name,                 // Tipo de teclado (Mobile).
      controller:       TextEditingController(),            // Controle do campo.
      inputFormatters:  [filtroApenasTexto],                // Filtro de texto.
      decoration:       textFormDecoration(titulo, icone),  // Decoracao do campo.
      autovalidateMode: AutovalidateMode.onUserInteraction, // Momento para validar o campo.
    );
  }


  /// Função para exibir uma mensagem de
  /// confirmação para fechar o formulário.
  Future<bool> sairFormularioConfirmacao() async {
    return await mensagemConfirmacao(context, 'Cancelar Alterações', 'Deseja sair do formulário ?\n(Os dados inseridos serão perdidos)');
  }

  /// Função para adicionar um novo
  /// equipamento no sistema EcoHome.
  Future<void> adiconarEquipamento() async{

    // Verificacao de campos vazios.
    if(keyFormulario.currentState!.validate()){

      keyFormulario.currentState!.save(); // Salvamento dos dados inseridos.
      equipamentos.add(novoEquipamento);  // Adicao do novo equipamento no sistema.
      await mensagemAviso(context, 'Operação Conclúida', 'O equipamento foi adicionado com sucesso !');
      if(mounted) Navigator.pop(context); // Fechamento do formulario.
    }
  }


  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        didPop = await sairFormularioConfirmacao();
        if(didPop && context.mounted) Navigator.pop(context); // Fechamento do formulario.
      },
      child: SimpleDialog(
        backgroundColor:  verdeThemeI,
        titlePadding:     const EdgeInsets.all(25),
        contentPadding:   const EdgeInsets.only(left: 25, right: 25, bottom: 25),
        title: const Center(child: Text('NOVO EQUIPAMENTO', style: styleBotoesConfirmacao)),
        shape: RoundedRectangleBorder(borderRadius: borderRadius10, side: const BorderSide(color: verdeThemeI, strokeAlign: 10)),
        children: [
          Form(
            key: keyFormulario,
            child: Column(
              children: [
                campoFormulario('Nome', const Icon(Icons.abc_rounded, color: verdeThemeI)),
                espacamentoV,
                DropdownButtonFormField(
                  onChanged: (TipoEnum? value) {},
                  onSaved: (newValue) { novoEquipamento.tipo = newValue!; },
                  validator: (value) { return (value == null) ? mensagemCampoVazio : null; },
                  items: tipos.entries.map((elemento) { // Itens.
                    return DropdownMenuItem(
                      value: elemento.key,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(elemento.value['nome']),
                          elemento.value['icone'],
                        ],
                      ),
                    );
                  }).toList(),
                  style: styleTextoNormal,        // Estilo do texto.
                  dropdownColor: fundoColor,      // Cor de DropDown.
                  borderRadius: borderRadius10,
                  iconEnabledColor: verdeThemeI,  // Cor do icone (habilitado).
                  decoration: textFormDecoration('Tipo', null),
                ),
                espacamentoV,
                campoFormulario('Marca', const Icon(Icons.logo_dev_rounded, color: verdeThemeI)),
                espacamentoV,
                campoFormulario('Modelo', const Icon(Icons.mode_rounded, color: verdeThemeI)),
              ],
            ),
          ),
          espacamentoV,
          espacamentoV,
          ElevatedButton(
            style: ButtonStyle(
              overlayColor:     const WidgetStatePropertyAll(headerColor),
              backgroundColor:  const WidgetStatePropertyAll(verdeThemeII),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: borderRadius10)),
            ),
            onPressed: () async { await adiconarEquipamento(); },
            child: const Text('ADICIONAR EQUIPAMENTO', style: styleBotoesConfirmacao),
          ),
          espacamentoV,
          ElevatedButton(
            style: ButtonStyle(
              overlayColor:     const WidgetStatePropertyAll(Colors.pink),
              backgroundColor:  const WidgetStatePropertyAll(Colors.redAccent),
              shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: borderRadius10)),
            ),
            onPressed: () async {
              if(await sairFormularioConfirmacao() && context.mounted) Navigator.pop(context);
            },
            child: const Text('VOLTAR', style: styleBotoesConfirmacao),
          ),
        ],
      ),
    );
  }
}