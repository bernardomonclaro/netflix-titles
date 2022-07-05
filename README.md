# README

Desafio Backend API

* Utilizei o SQLite como banco de dados.

* O arquivo .csv está localizado em `lib/tasks`.

* Mudei o nome da coluna type no arquivo .csv, pois a mesma é uma palavra reservada e estava dando conflito. Troquei para show_type.

* Criei uma task chamada: `rails dev:setup` que importa o arquivo csv, faz a leitura, deleta o BD, cria o BD e migra os dados.

* Troquei o nome dos seguintes atributos para obedecerem ao padrão da response pedido:

  * show_type --> genre
  
  * date_added --> published_at
  
  * release_year --> year
  
* As respostas do endpoint estão ordenadas em ordem decrescente pelo ano de lançamento.

* Adicionei no Model Netflix a validação: `validates :title, uniqueness: true` para não permitir duplicidade de registros.

* Utilizei o scope para filtrar os registros por ano(year), gênero(genre) e país(country).

* Fiz uma paginação no endpoint de listagem de filmes com 10 por página.

* Utilizei o Rspec para testar o funcionamneto da API.
