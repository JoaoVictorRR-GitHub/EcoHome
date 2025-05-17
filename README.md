
# | $$\textbf{Eco} \color{Green} \textbf{Home}$$

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen)]()
[![License](https://img.shields.io/github/license/JoaoVictorRR-GitHub/EcoHome)](LICENSE)
[![Flutter](https://img.shields.io/badge/flutter-2.10-blue)](https://flutter.dev)

<p align="justify">
  <strong>EcoHome</strong> é um aplicativo móvel desenvolvido em <strong>Flutter</strong> como parte de um projeto para uma feira de ciências.
  Ele foi criado com o objetivo de simular o monitoramento e o gerenciamento do consumo e da geração de energia elétrica em uma residência,
  promovendo o uso mais eficiente e sustentável da energia.
  <br><br>
  A aplicação utiliza dados simulados de sensores virtuais conectados a equipamentos domésticos, permitindo ao usuário visualizar quais dispositivos
  consomem mais energia, estimar o impacto da geração própria (como por painéis solares residenciais) e prever os gastos com eletricidade ao longo do
  tempo, com base nas tarifas locais.
  <br><br>
  Apesar de não estar conectado a uma rede elétrica real, o <strong>EcoHome</strong> oferece uma experiência educativa e interativa, ajudando os
  usuários a entender como o consumo consciente pode reduzir custos e contribuir para a sustentabilidade.
</p>

---

### FUNCIONALIDADES

- Simulação de consumo energético em tempo real.
- Visualização de gráficos e despesas ao longo do tempo.
- Cadastro de dispositivos eletrônicos e seus consumos.


  ### | $$\color[RGB]{249, 199, 79} \textbf{ÁREA INICIAL}$$
  ---
  <section align="center">
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Inicio.jpg"  width="20%"/>
  </section>
  
  
  
    ### | $$\color{LightGreen} \textbf{ÁREA CONSUMO}$$
  ---
  <p align="justify">
    A área de consumo apresenta um gráfico de pizza com a porcentagem de equipamentos, de um mesmo tipo, adicionados ao sistema
    (<strong>Imagem 01</strong>) ou a porcentagem do consumo de energia total de cada tipo de equipamento (<strong>Imagens 02 e 03</strong>).
  </p>
  
  <section align="center">
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Consumo%20-%20Grafico%20Tipos.jpg" width="20%"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Consumo%20-%20Grafico%20Consumo%20I.jpg" width="20%"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Consumo%20-%20Grafico%20Consumo%20II.jpg" width="20%"/>
  </section>
  
  
  
  ### | $$\color[RGB]{246, 249, 244} \textbf{ÁREA ECONOMIA}$$
  ---
  <p align="justify">
    A área de economia exibe um gráfico que atualiza periodicamente os gastos totais, em reais (<strong>R$</strong>),
    calculados a partir dos dados de consumo e de geração de energia coletados dos equipamentos ao longo do tempo.
  </p>
  
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
  
  
  
  ## | $$\color{Green} \textbf{ÁREA EQUIPAMENTO}$$
  
  <p align="justify">
    Essa área exibe os equipamentos adicionados ao sistema e apresenta uma ferramenta para adicionar novos equipamentos e removê-los.
  </p>
  
  <section align="center">
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Equipamento.jpg" width="20%"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Equipamento%20-%20Formulario.jpg" width="20%"/>
  </section>

---

### | $$\color{Cyan} \textbf{SIMULAÇÃO}$$

  * <p align="justify">
    A cada intervalo de tempo (<strong>10s</strong>), os equipamentos adicionados ao sistema transmitem seus dados de consumo/geração de energia (em <strong>Watts</strong>) daquele instante, obtidos da rede elétrica por meio dos sensores.
  </p>
    
  * <p align="justify">
    O software simula os dados do consumo/geração de energia (em <strong>Watts</strong>) de um equipamento, gerando para ele um valor aleatório (entre <strong>0.0</strong> e <strong>1.0</strong>) multiplicado por uma base de consumo/geração de energia correspondente ao tipo de equipamento.
  </p>
    
  * <p align="justify">
    Tipos de equipamentos que consomem energia, como $$\color[RGB]{196, 188, 172} \textbf{Ar-Condicionado}$$, $$\color[RGB]{139, 106, 70} \textbf{Geladeira}$$, $$\color[RGB]{227, 181, 5} \textbf{Lâmpada}$$ e $$\color{Green} \textbf{Outros}$$, têm um multiplicador de <strong>60W</strong> para a base de consumo, enquanto os equipamentos do tipo $$\color[RGB]{244, 124, 34} \textbf{Painel Solar}$$ têm um multiplicador de <strong>50W</strong> para a base de geração de energia.
  </p>

---

### | $$\color{OrangeRed} \textbf{LICENÇA}$$

Este projeto está licenciado sob a [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0). Veja o arquivo [LICENSE](LICENSE) para mais detalhes.
---

## Agradecimentos

Obrigado por visitar o EcoHome! Contribuições e feedback são muito bem-vindos! 🌱

