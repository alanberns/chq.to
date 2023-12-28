# chq.to
chq.to es una aplicación web que permite acortar enlaces
Debes registrarte, y luego podrás crear enlaces cortos, los cuales redireccionan a la URL destino.
Los enlaces pueden editarse y eliminarse, y cuentan con estadísticas de acceso

### Requisitos técnicos
* Ruby 3.2.2
* Ruby on Rails 7.1.2
* SQLite3
* Node.js

### Instalación
* git clone https://github.com/alanberns/chq.to.git
* bundle install
* rails db:migrate
* rails server

###### Datos de prueba
* rails db:seed

usuarios de prueba:
* username: testuno
* username: testdos
* username: testvacio

* passwords: 
- asdfg (para todos los usuarios)
- asdfg123! (para todos los links privados)



### Gemas 
* bcrypt: Para encriptar y validar contraseñas

* kaminari: Para paginación

* bootstrap: Framework frontend

* groupdate: Para realizar busquedas de agrupación por fechas en la base de datos