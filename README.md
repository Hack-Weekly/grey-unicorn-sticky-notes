# grey-unicorn-sticky-notes-app

## Development

### Dependencies

- ruby 3.1.2, (install with [rbenv](https://github.com/rbenv/rbenv) recommended)
- docker and docker-compose: not necessary if you can install postgresql or you machine
- postgresql: required if you cannot use docker

### Getting started

- To get the development database up and running

  - With docker and docker-compose installed: ensure you have no postgresql
    running on your machine and run

    ```sh
    docker-compose up -d
    ```

    To connect to the database console run

    ```sh
    docker-compose exec dev_db psql -U postgres
    ```

  - Without docker: install postgresql with your system's package manager
    and ensure it's up and running

- Install required packages

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

  Open `http://localhost:3000` in your browser and you're ready to hack!
