# Projeto de Filtos Passivos

# Nome: Pedro Henrique Gnoatto Rosa RA:2342901

## Problema
Você foi contratado(a) como engenheiro(a) para projetar um crossover passivo para uma caixa de som de duas vias (woofer e tweeter). O objetivo é garantir que os sinais de baixa frequência sejam enviados apenas para o woofer e os de alta frequência apenas para o tweeter, com máxima fidelidade e uma transição suave.

##Objetivos
  - Calcular valores ideias e selecionar os valores reais dos resistores e capacitores, apartir da frequência de corte e impedância da carga;
  - Gerar as funções de transferência dos filtros Passa-Baixa e Passa-Alta ideias e reais;
  - Gerar gráficos de Bode para comparar os filtros ideias e reais.
  - Documentar o projeto

## Fundamentação Teórica
O projeto envolve o desenvolvimento de filtros de 2ª ordem **Butterworth**, escolhido devido possuir resposta plana na banda passante e uma transição suave no **woofer** e **tweeter**. As funções que descrevem o comportamento dos filtros são:

1. **Butterworth de 2ª ordem**

