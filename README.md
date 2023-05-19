## Para acessar a aplicação em produção

Acessar o link:
- https://video-watch-party.herokuapp.com/

## Para rodar a aplicação

### Necessário 

Para rodar o projeto é necessário ter:

  1. Ruby 3.2.0
  2. Ruby on Rails 7.0.4
  3. PostgreSQL

### Dependências

Instalar as dependências necessárias:

```
  $ bundle install
  $ yarn install
```

### Banco de dados

Criar o banco de dados:

```
  $ rails db:create
  $ rails db:migrate
```

### Rodar a aplicação

Com o ambiente configurado:

```
  $ rails s
```