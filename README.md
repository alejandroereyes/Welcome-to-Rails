# Welcome to Rails

  This program uses Rails through the browser to process requests and send the appropriate response.

## Features

  * User can access all users info using `http://localhost:3000/users`
  * User can access user info via id, first_name, last_name, or age parameter using the code examples below
    `http://localhost:3000/users/1`
    `http://localhost:3000/users?first_name=s`
  * User can set limit on amount of users sent back using `http://localhost:3000/users?limit=10&offset=10`
  * User can offset starting point of users sent back `http://localhost:3000/users?limit=10&offset=10`
  * A user can be deleted via id using `http://localhost:3000/users/1/delete`
  * A new user can be added to the database using `http://localhost:3000/users/create?first_name=Jenny&last_name=Jaguar&age=44`

## How to use

  * Run `rails s` inside the `welcome_to_rails` folder
  * open `http://localhost:3000/` to access the app

____________________

* Ruby version 2.2.0



