import 'dart:math';



/// ###### Classe de gasto.
class Gasto {

  /// Tempo (s) em que o consumo foi gerado.
  final double tempoAtual;
  /// Gasto (R$) com o consumo de energia.
  late double gasto;
  /// Consumo de energia (kW).
  final double consumo;
  /// Tempo de consumo dos equipamentos (s).
  final tempoConsumo;

  /// Construtor da classe.
  Gasto(this.consumo, this.tempoAtual, this.tempoConsumo){
    double preco = 0.674;     // Preço (R$/kWh).
    double energia = (consumo * tempoConsumo) / (3.6 * pow(10, 6)); // Energia consumida (kWh).
    gasto = energia * preco;  // Gasto (R$/kWh).
  }
}


/// ###### Lista de gastos com o consumo de energia.
List<Gasto> gastos = [];