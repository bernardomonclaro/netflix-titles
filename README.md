# README

Instruções do Desafio:
Criar um endpoint que faça a leitura de um arquivo .csv, popule o banco de dados com essas informações e com isso será necessário exibir todos os registros em json.
● O desafio deve ser desenvolvido utilizando Ruby e tendo o Rails como framework;
● Seguindo o padrão API RESTful;
● Seguir o Rubocop style-guide;
● A leitura do arquivo .csv deve ser através de um endpoint diferente da listagem de títulos;
● Ordenar pelo ano de lançamento;
● Filtrar os registros por ano de lançamento, gênero, país*;
● Garantir que não haja duplicidade de registros;
● O projeto deve ser disponibilizado em um repositório aberto no GitHub. Envie a URL assim que
possível;

Explicando:
● O arquivo .csv está localizado em `lib/tasks`.
● Mudei o nome da coluna type no arquivo .csv, pois a mesma é uma palavra reservada e estava dando conflito. Troquei para show_type.
● Criei uma task chamada: `rails dev:setup` que importa o arquivo .csv, faz a leitura, deleta o BD, cria o BD e migra os dados.
● Troquei o nome dos seguintes atributos para obedecerem ao padrão da response pedido:
  ● show_type --> genre
  ● date_added --> published_at
  ● release_year --> year
● As respostas do endpoint estão ordenadas em ordem decrescente pelo ano.
● Adicionei no Model Netflix a validação: `validates :title, uniqueness: true` para não permitir duplicidade de registros.
● Utilizei o SQLite como banco de dados.
● Os registros podem ser filtrados por ano(year), gênero(genre) e país(country).
