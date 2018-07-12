# Job GO!
[![Build Status](https://travis-ci.org/gitDbits/job_go.svg?branch=master)](https://travis-ci.org/gitDbits/job_go) [![Maintainability](https://api.codeclimate.com/v1/badges/9636fa9165d3c122b696/maintainability)](https://codeclimate.com/github/gitDbits/job_go/maintainability)

Projeto desenvolvido no bootcamp da [Campus Code](https://campuscode.com.br/){:target="_blank"} em Ruby on Rails 5 com prática de TDD, permitindo ao usuário:

    * Cadastrar e editar empresas.
    * Cadastrar e editar categorias.
    * Cadastrar vagas de trabalho.
    * Visualizar vagas de trabalho por empresa e por categoria.
    * Visualizar vagas em destaque, através de uma marcação.
    * Visualizar empresa que estão em destaque |possui mais de 5 vagas ofertadas|.
    * Visualizar vagas recentes |data da vaga até 5 dias após a sua publicação|.
    * As vagas de trabalho expirão após 90 dias.

Para maiores detalhes do projeto confira no meu [Blog](http://diegonoronha.com.br/) :)

## Vamos lá
Verifique os requisitos abaixo, fique a vontade para realizar o clone do projeto e realizar suas modificações.

### Pré requisitos
    * Ruby 2.4 >= 2.5
    * Rails 5.0.0

### Instalar

Abra o seu terminal e execute os seguintes comandos:

```
git clone https://github.com/gitDbits/job_go.git
cd job_go
rails db:create
rails db:migrate
bundle install
rails s
```

## Rodar os testes

Execute o seguinte comando no seu terminal:

```
rspec
```
Os 27 testes da aplicaçao encontra-se na pasta job_go/spec/features/

## Construido com

* [Ruby on Rails](http://www.dropwizard.io/1.0.2/docs/){:target="_blank"} - The web framework used
* [Rspec](https://github.com/rspec/rspec){:target="_blank"} - Framework BDD
* [Capybara](https://github.com/teamcapybara/capybara){:target="_blank"} - Helps you test web applications
* [SimpleCov](https://github.com/colszowka/simplecov){:target="_blank"} - Code coverage analysis tool for Ruby
* [Rubocop](https://github.com/rubocop-hq/rubocop){:target="_blank"} - A Ruby static code analyzer
* [friendly_id](https://github.com/norman/friendly_id){:target="_blank"} - Create pretty URL’s and work with human-friendly
* [Jquery mask rails](https://github.com/maurcarvalho/jquery_mask_rails){:target="_blank"} - A Rails gem of the jQuery Plugin mask
