# Code test - Bank accounting

## Summary

Was used Ruby on Rails for the code challenge presented. To accomplish the goal
it was created two Models `User` and `BankAccount` where a user has_one bank_account
and bank_account belongs_to user. The method of transfer_money was implemented on
BankAccount model.

Even though the optimal way of dealing with transactions would
be having a intermediate model `Transaction` coupling the transactions between
bank_accounts, for the simplicity this intermediate model was abstracted to the
method `transfer_money` on BankAccount.

## Specs

* Postgresql
* Ruby 2.3.4
* Rails 5.1.5
* Bootstrap
* Rspec + Capybara
* FactoryBot
* Devise

## Running the tests

To run the tests just clone the repository, `bundle install` the dependencies,
`rails db:create`, `rails db:migrate` and then `rspec`.

## Running the app

To run the app just clone the repository, `bundle install` the dependencies,
`rails db:create`, `rails db:migrate`, `rails db:seed` to create a little seed.

Then run `rails s` to start the application locally.
