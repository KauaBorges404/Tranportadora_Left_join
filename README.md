# 🚚 Projeto Transportadora: Estudo de SQL e JOINs

Este repositório/projeto contém um script SQL desenvolvido para simular o banco de dados de uma empresa de transportes. O objetivo principal deste projeto é praticar e demonstrar o uso de junções em banco de dados, com foco especial no comando `LEFT JOIN`.

## 🗄️ Estrutura do Banco de Dados

O banco de dados (`transportadora_left`) é composto por duas tabelas principais relacionadas entre si:

1. **`motorista`**: Armazena os dados dos motoristas da transportadora.
   * `id`: Identificador único (Chave Primária).
   * `nome`: Nome do motorista.
   * `cnh`: Categoria da Carteira Nacional de Habilitação (ex: C, D, E).
   * `cidade_base`: Cidade de origem/base do motorista.

2. **`entrega`**: Armazena as entregas que precisam ser realizadas.
   * `id`: Identificador único (Chave Primária).
   * `codigo`: Código de rastreio único da entrega.
   * `destino`: Cidade de destino da carga.
   * `peso_kg`: Peso da carga em quilogramas.
   * `status`: Situação atual da entrega (Pendente, Em rota, Entregue).
   * `motorista_id`: Chave Estrangeira que relaciona a entrega ao motorista responsável.

## 🔍 Consultas e Exercícios Realizados

O script inclui um conjunto de consultas (`SELECT`) que respondem a perguntas de negócio específicas, demonstrando o comportamento dos diferentes tipos de `JOIN`:

* **Compreensão do LEFT JOIN:** Exibe todos os motoristas e seus destinos de entrega, garantindo que motoristas sem entregas também apareçam no resultado.
* **Comparação com INNER JOIN:** Uma versão da consulta acima usando `INNER JOIN`, que retorna estritamente os motoristas que possuem pelo menos uma entrega atribuída (excluindo os que não têm entregas).
* **Filtro de Nulos (Null Check):** Identifica exatamente quais motoristas estão ociosos (não possuem nenhuma entrega) verificando quais registros retornam `NULL` do lado direito da junção.
* **Agregação (GROUP BY):** Conta o total de entregas por motorista, exibindo o número `0` para aqueles que estão sem carga no momento.
* **Filtros Adicionais:** Lista todos os motoristas que possuem habilitação da categoria 'E' junto com seus destinos, mantendo os motoristas dessa categoria que estão sem entregas.

## 🚀 Como executar

1. Abra o seu SGBD de preferência (MySQL, MariaDB, etc.).
2. Execute a primeira parte do script para criar o banco (`CREATE DATABASE`), selecioná-lo (`USE`) e criar as tabelas.
3. Execute as intruções `INSERT INTO` para popular as tabelas com os dados de teste.
4. Execute as consultas `SELECT` individualmente para analisar e validar os resultados de cada uma.
