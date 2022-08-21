# RestApi

Elixir app for pracite purpose.
- implement simple rest api
- implement Apache Pulsar
  - publish message
  - receive message

## Installation

### install erlang & elixir
- use eg. asdf package manager

## Apache Pulsar
- to create admin user
```bash
CSRF_TOKEN=$(curl http://localhost:7750/pulsar-manager/csrf-token)
curl \
   -H 'X-XSRF-TOKEN: $CSRF_TOKEN' \
   -H 'Cookie: XSRF-TOKEN=$CSRF_TOKEN;' \
   -H "Content-Type: application/json" \
   -X PUT http://localhost:7750/pulsar-manager/users/superuser \
   -d '{"name": "admin", "password": "apachepulsar", "description": "test", "email": "username@test.org"}'
```
- pulsar admin is on address localhost:9527

## Run app
- default port is 9999
- to overrite port type
```bash
export PORT=7777
```
- to run app
```bash
// install dependencies
mix get.deps

// run app in console
iex -S mix      
```



