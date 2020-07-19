# Estimativa de Volumes de Árvores

# Descrição

Modelos de aprendizado de máquina são bastante usados na área da engenharia florestal (mensuração florestal) para, por exemplo, estimar o volume de madeira de árvores sem ser necessário abatê-las. <br>

O processo é feito pela coleta de dados (dados observados) através do abate de algumas árvores, onde sua altura, diâmetro na altura do peito (dap), etc, são medidos de forma exata. Com estes dados, treina-se um modelo de AM que pode estimar o volume de outras árvores da população. <br>

Os modelos, chamados alométricos, são usados na área há muitos anos e são baseados em regressão (linear ou não) para encontrar uma equação que descreve os dados. Por exemplo, o modelo de Spurr é dado por: <br>

`Volume = b0 + b1 * dap2 * Ht` <br> <br>

Onde dap é o diâmetro na altura do peito (1,3metros), Ht é a altura total. Tem-se vários modelos alométricos, cada um com uma determinada característica, parâmetros, etc. Um modelo de regressão envolve aplicar os dados observados e encontrar b0 e b1 no modelo apresentado, gerando assim uma equação que pode ser usada para prever o volume de outras árvores. <br>

Dado o arquivo Volumes.csv, que contém os dados de observação, escolha um modelo de aprendizado de máquina com a melhor estimativa, a partir da estatística de correlação. <br> <br>

Tarefas:
- Carregar o arquivo [Volumes.csv](http://www.razer.net.br/datasets/Volumes.csv)
- Eliminar a coluna NR, que só apresenta um número sequencial
- Criar partição de dados: treinamento 80%, teste 20%
- Usando o pacote "caret", treinar os modelos: Random Forest (rf), SVM (svmRadial), Redes Neurais (neuralnet) e o modelo alométrico de SPURR
- O modelo alométrico é dado por: Volume = b0 + b1 * dap2 * Ht `alom <- nls(VOL ~ b0 + b1*DAP*DAP*HT, dados, start=list(b0=0.5, b1=0.5))`
- Efetue as predições nos dados de teste
- Calcule a correlação entre a predição e os dados observados
- Escolha o melhor modelo
