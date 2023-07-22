# grey-unicorn-sticky-notes-app

## Development

### Dependencies

- ruby 3.1.2, (install with [rbenv](https://github.com/rbenv/rbenv) recommended)
- docker and docker-compose

### Getting started

- To get the development database up and running

  Ensure you have no postgresql running on you machine and run

  ```sh
  docker-compose up -d
  ```

- Install require packages 

  ```sh
  bundle install
  yarn install
  ```

- Execute pending migrations

  ```sh
  bin/rails db:migrate
  ```

- Run the app

  ```sh
  bin/dev
  ```

- To try the app 

  Open `localhost:3000` in your browser and enjoy!

- To connect to the databse console run

  ```sh
  docker-compose exec dev_db psql -U postgres
  ```
