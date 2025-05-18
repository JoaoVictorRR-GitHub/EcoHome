
# | $$\textbf{Eco} \color{Green} \textbf{Home}$$ 🏡

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

### | $$\color{RedOrange} \textbf{FUNCIONALIDADES}$$ 📑

- Simulação de consumo e geração de energia elétrica em tempo real.
- Visualização de gráficos dinâmicos e projeções de despesas.
- Cadastro e remoção de dispositivos eletrônicos e seus consumos.


  ### | 🏠 $$\color[RGB]{249, 199, 79} \textbf{TELA INICIAL}$$
  ---
  <section align="center">
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Inicio.jpg" width="20%"/>
  </section>
  
  
  
  ### | 🔌 $$\color{LightGreen} \textbf{TELA DE CONSUMO}$$
  ---
  <p align="justify">
    Na aba de <strong>equipamentos</strong> (<strong>Imagem 01</strong>) é exibido um gráfico dinâmico de pizza com a porcentagem de
    equipamentos integrados ao sistema que possuem o mesmo tipo. Na aba de <strong>consumo</strong> (<strong>Imagens 02 e 03</strong>)
    é exibo um gráfico de pizza com a porcentagem do consumo de energia total, distribuido entre cada tipo de equipamento.
    <br><br>
  </p>
  
  <section align="center">
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Consumo%20-%20Grafico%20Tipos.jpg" width="20%" title="Imagem 01"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Consumo%20-%20Grafico%20Consumo%20I.jpg" width="20%" title="Imagem 02"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Consumo%20-%20Grafico%20Consumo%20II.jpg" width="20%" title="Imagem 03"/>
  </section>
  
  
  
  ### | 💸 $$\color[RGB]{246, 249, 244} \textbf{TELA DE ECONOMIA}$$
  ---
  <p align="justify">
    Na tela de economia é exibido um gráfico de custos acumulados, em reais (<strong>R$</strong>), que atualiza
    periodicamente a curva de valores conforme os dados de consumo e geração de energia são coletados.
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
  
  
  
  ## | ⚙️ $$\color{Green} \textbf{TELA DE EQUIPAMENTOS}$$
  
  <p align="justify">
    Essa tela exibe os equipamentos integrados ao sistema e disponibiliza formas para adicionar novos equipamentos ou removê-los.
  </p>
  
  <section align="center">
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Equipamento.jpg" width="20%"/>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <img src="https://github.com/JoaoVictorRR-GitHub/EcoHome/raw/master/Exibicao/Area%20Equipamento%20-%20Formulario.jpg" width="20%"/>
  </section>

---

### | $$\color{Cyan} \textbf{SIMULAÇÃO}$$

  * **Envio Automático:**
    * <p align="justify">
      A cada intervalo de tempo (<strong>10s</strong>), os equipamentos integrados ao sistema transmitem seus dados de
      consumo/geração de energia (em <strong>Watts</strong>) daquele instante, obtidos da rede elétrica por meio dos sensores.
    </p>

  * **Geração Aleatória de Consumo:**
    * <p align="justify">
      O software simula os dados do consumo/geração de energia (em <strong>Watts</strong>) de um equipamento gerando para ele
      um valor aleatório (entre <strong>0.0</strong> e <strong>1.0</strong>), que é multiplicado por uma base de consumo/geração
      de energia correspondente ao tipo de equipamento.
    </p>

  * **Categorias de Equipamentos:**
    * <p align="justify">
      Tipos de equipamentos que consomem energia, como $$\color[RGB]{196, 188, 172} \textbf{Ar-Condicionado}$$,
      $$\color[RGB]{139, 106, 70} \textbf{Geladeira}$$, $$\color[RGB]{227, 181, 5} \textbf{Lâmpada}$$ e $$\color{Green} \textbf{Outros}$$,
      têm um multiplicador de <strong>60W</strong> para a base de consumo, enquanto os equipamentos do tipo $$\color[RGB]{244, 124, 34} \textbf{Painel Solar}$$
      têm um multiplicador de <strong>50W</strong> para a base de geração de energia.
    </p>

---

### | $$\color{OrangeRed} \textbf{LICENÇA}$$ 🌱

Este projeto está licenciado sob a [Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0). Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---
