# $$\textbf{Eco} \color{Green} \textbf{Home}$$

O **EcoHome** é uma aplicação desenvolvida para um projeto de feira de ciências cuja ideia é a de poder gerir o consumo e a geração de energia elétrica dentro de uma casa, com equipamentos capazes de transmitir dados de consumo através de sensores, visando uma utilização mais sustentável da energia elétrica nas residências.
  
O objetivo da aplicação é obter dados de consumo e geração de energia dos equipamentos adicionados ao sistema, que estão integrados à rede elétrica da casa, para fornecer ao morador uma visão geral de quais equipamentos podem estar consumindo mais energia, quanto que a geração de energia elétrica da casa pode estar impactando positivamente na diminuição do consumo de energia da rede elétrica e trazer uma previsão dos gastos totais com a utilização da energia elétrica ao longo do tempo, com base nas tarifas locais.

---

### $$\color{OrangeRed} \textbf{Simulação}$$

* A cada intervalo de tempo (**10s**), os equipamentos que foram adicionados ao sistema transmitem seus dados de consumo/geração de energia (em **Watts**) daquele instante, obtidos da rede elétrica por meio dos sensores.
    
* O software simula os dados do consumo/geração de energia (em **Watts**) de um equipamento gerando para ele um valor aleatório (entre **0.0** e **1.0**) que é multiplicado por uma base de consumo/geração de energia correspondente ao tipo de equipamento.
    
* Equipamentos que consomem energia, como $$\color[RGB]{196, 188, 172} \textbf{Ar-Condicionado}$$, $$\color[RGB]{139, 106, 70} \textbf{Geladeira}$$, $$\color[RGB]{227, 181, 5} \textbf{Lâmpada}$$ e $$\color{Green} \textbf{Outros}$$, têm um multiplicador de **60W** para a base de consumo, enquanto os equipamentos do tipo $$\color[RGB]{244, 124, 34} \textbf{Painel Solar}$$ têm um multiplicador de **50W** para a base de geração de energia.

---

## $$\color{OrangeRed} \textbf{Área Inicial}$$

<section align="center">
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Inicio.jpg"  width="20%"/>
</section>



## $$\color{OrangeRed} \textbf{Área Consumo}$$

A área de consumo apresenta, de modo geral, um gráfico de pizza com a porcentagem de equipamentos de um mesmo tipo adicionados ao sistema (**Imagem 01**) e a porcentagem geral do consumo de energia de cada tipo de equipamento (**Imagens 02 e 03**), com atualizações periódicas.

<section align="center">
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Consumo%20-%20Grafico%20Tipos.jpg" width="20%"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Consumo%20-%20Grafico%20Consumo%20I.jpg" width="20%"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Consumo%20-%20Grafico%20Consumo%20II.jpg" width="20%"/>
</section>



## $$\color{OrangeRed} \textbf{Área Economia}$$

<section align="center">
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Economia%20I.jpg" width="20%"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Economia%20II.jpg" width="20%"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Economia%20III.jpg" width="20%"/>
</section>

<section align="center">
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Economia%20IV.jpg" width="20%"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Economia%20V.jpg" width="20%"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Economia%20VI.jpg" width="20%"/>
</section>



## $$\color{OrangeRed} \textbf{Área Equipamento}$$

<section align="center">
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Equipamento.jpg" width="20%"/>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Equipamento%20-%20Formulario.jpg" width="20%"/>
</section>
