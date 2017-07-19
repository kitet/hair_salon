# Hair Salon Management

A ruby application to manage hair salon stylists and clients. 

by: [kitet](http://kitet.github.io/)

## Technologies used

`Ruby` `RSpec` `Sinatra` `Postgres` `Materialize(for styling)`

## Running the project

1. CLone the repo: `$ git clone`

2. Install dependencies: `$ bundle`

3. Install [Postgres](https://www.postgresql.org/)

4. Create production and test databases:

```
CREATE DATABASE hair_salon;
CREATE TABLE clients (id serial PRIMARY KEY, name varchar(20), phone varchar(20) stylist_id int);
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar(20));
CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
```

5. Run the app: `$ ruby app.rb`

6. Navigate to [http://localhost:4567/](http://localhost:4567/)

Use `$ rspec` to run tests.

## LICENSE

[MIT LICENSE](https://github.com/kitet/hair_salon/blob/master/LICENSE)
