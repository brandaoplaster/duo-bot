# ChatBot :robot:

This project is a chatbot with a FAQ function,
that allows users to store questions and answers,
and get there easily when needed.


## Functionalities
 - List of questions and answers
 - Inclusion of new questions
 - Question removal
 - Survey of questions and answers
 - Search questions and answers by hashtag
 - List available commands

## Prerequisites

> You just need to have the **docker** and **docker-compose** installed on your machine.

## Configuration
To change database settings **config/database.rb**

## Getting Started
To get the app running, run the following commands:

- Build container
```
docker-compose build
```

- Installing the gems
```
docker-compose run --rm webiste bundle install
```

- Creating the database
```
docker-compose run --rm website bundle exec rails db:create
```

- Generating migrate
```
docker-compose run --rm website bundle exec rails db:migrate
```

- Up service
```  
docker-compose up
```

## Stack
 - Ruby
 - Sinatra
 - Postgres
 - Dialogflow
 - Docker
 - Docker compose



## Authors

- [brandaoplaster](https://github.com/brandaoplaster)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
