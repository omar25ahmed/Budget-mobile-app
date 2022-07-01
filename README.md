# Budget App

The Ruby on Rails capstone project is about building a mobile web application where you can manage your budget: you have a list of transactions associated with a category, so that you can see how much money you spent and on what.
## Built With

- Ruby on Rails

## Getting Started

[Live demo](https://budget-mobile-omar.herokuapp.com/)

### Prerequisites

- Ruby
- Postgres server

### Setup

Clone this repo and enter the directory.

```sh
git@github.com:omar25ahmed/Budget-mobile-app.git && cd budget-mobile-app
```

### Install

Run the following command to install all the dependencies.

```sh
bundler install
```

### Usage

Run the following command to start the server, then go to http://localhost:3000

```sh
rails db:create # create database
rails db:migrate # migrate tables
rails db:seed # load all data in database from seed.rb

bin/dev # necessary to start the app for the first time
---- or ----
rails s # can be used after starting the app at least once
```

### Run tests

```sh
bundle exec rspec spec
```

## Author


👤 **Omar Ragheb**

- GitHub: [https://github.com/omar25ahmed](https://github.com/omar25ahmed)
- LinkedIn: [https://www.linkedin.com/in/omar-ragheb/](https://www.linkedin.com/in/omar-ragheb/)
- Twitter: [https://twitter.com/Omar25Ahmed](https://twitter.com/Omar25Ahmed)

## Acknowledgements
Original design idea by [Gregoire Vella on Behance](https://www.behance.net/gregoirevella). 

## Show your support

Give a ⭐️ if you like this project!
