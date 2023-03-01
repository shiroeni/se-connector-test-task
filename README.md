# Example of Connector App for Salt Edge Compliant (test task)

## Run

Create and `config/database.yml` and `config/settings.yml` (examples available in `config/`).

Can be installed as usual Ruby on Rails application:

```bash
$ bundle install
$ rake db:create db:migrate
$ rails s
```

## What used except Ruby on Rails

- RSpec for tests, webmock for stubbing requests to external services

- JWT for working with JWT

- *Dry::Monads* for *Do notation*

- *KingKonf* for configs

In any real application, for *Token creation via redirect* i'd use something like "oauth2" gem, but I am not use can I use it in test task.

## What completed

* Jwt encoding and decoding (`app/services/jwt_service.rb`)

* Controller with action that creates tokens (`app/controller/tokens_controller`)

* Written specs on controller, services and interactors
