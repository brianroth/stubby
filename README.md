# README

## To start the application

Build the application and it's containers

```docker-compose build```

Create the database

```docker-compose run web rake db:create```

Run database migrations

```docker-compose run -e "RAILS_ENV=development" web rake db:migrate```

Start the application

```docker-compose up -d```

## Running tests

Build the application and it's containers

```docker-compose build```

Run the test suite

```docker-compose run web rspec```

## Debugging with pry

Use ```docker ps``` to find the container id and then ```docker attach``` in order to attach to the running process.

You can now perform your usual debug commands. When done debugging type exit to leave the pry debug session.

To detach from the container without exiting press ```control + p```  and then ```control + q```. Note that if you hit ```control + c``` instead of the escape sequence the container process will exit.

From http://www.chris-kelly.net/2016/07/25/debugging-rails-with-pry-within-a-docker-container/

