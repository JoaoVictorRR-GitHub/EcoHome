import 'package:flutter/material.dart';
import '../Globais/fontes_estilos.dart';



/// ###### Lista dos tipos de equipamentos que o sistema aceita.
enum TipoEnum {geladeira, arCondicionado, painelSolar, lampada, outros}
Map<TipoEnum, Map<String, dynamic>> tipos = {
  TipoEnum.arCondicionado:  {'nome': "AR-CONDICIONADO", 'icone': const Icon(Icons.air_rounded,            color: fundoColor,    shadows: [sombraPadraoI])},
  TipoEnum.geladeira:       {'nome': "GELADEIRA",       'icone': const Icon(Icons.ac_unit_rounded,        color: kabulTheme,    shadows: [sombraPadraoII])},
  TipoEnum.painelSolar:     {'nome': "PAINEL SOLAR",    'icone': const Icon(Icons.solar_power_rounded,    color: laranjaTheme,  shadows: [sombraPadraoI])},
  TipoEnum.lampada:         {'nome': "LÂMPADA",         'icone': const Icon(Icons.light_rounded,          color: amareloTheme,  shadows: [sombraPadraoI])},
  TipoEnum.outros:          {'nome': "OUTROS",          'icone': const Icon(Icons.devices_other_rounded,  color: verdeThemeI,   shadows: [sombraPadraoI])},
};


/// ###### Classe de um equipamento.
class Equipamento {
  /// Nome do equipamento.
  late String nome;
  /// Tipo de equipamento.
  late TipoEnum tipo;
  /// Marca do equipamento.
  late String marca;
  /// Modelo do equipaento.
  late String modelo;

  /// Energia do equipamento consumida no mês (kW/h).
  double consumoEnergia;
  /// Energia gerada/retornada pelo equipamento (kW/h).
  double geracaoEnergia;

  /// Construtor da classe Equipamento.
  Equipamento({
    this.nome   = '',
    this.tipo   = TipoEnum.outros,
    this.marca  = '',
    this.modelo = '',
    this.consumoEnergia = 0.0,
    this.geracaoEnergia = 0.0
  });
}


/// ###### Lista dos equipamentos cadastrados no sistema.
List<Equipamento> equipamentos = [
  Equipamento(nome: 'Geladeira One Piece',      tipo:  TipoEnum.geladeira,      marca: 'Usopp',         modelo: 'Zoro Perdido'),
  Equipamento(nome: 'Geladeira Galáctica',      tipo:  TipoEnum.geladeira,      marca: 'Garp',          modelo: 'Punho do Amor'),
  Equipamento(nome: 'Ar-Condicionado Ice Time', tipo:  TipoEnum.arCondicionado, marca: 'Franky House',  modelo: 'Aokiji Dorminhoco'),
  Equipamento(nome: 'Painel Solar Sunny',       tipo:  TipoEnum.painelSolar,    marca: 'Franky House',  modelo: 'Laser Energético'),
  Equipamento(nome: 'Lâmpada Infinita',         tipo:  TipoEnum.lampada,        marca: 'Borsalino',     modelo: 'Solar'),
  Equipamento(nome: 'Computador Gamer',         tipo:  TipoEnum.outros,         marca: 'Variado',       modelo: 'Variado'),
];