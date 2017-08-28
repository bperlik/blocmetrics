## Blocmetrics
An analytic service to track events on websites.

Users can sign-up, login, register an application to track events, view and save events tracked on the registered applications, view graphs of the event data, and logout.

Made with my mentor as part of the Software Engineering Track at [Bloc](http://bloc.io).

# Blocmetrics is a Ruby on Rails application

The source code is here on GitHub: https://github.com/bperlik/blocmetrics

The app is deployed on Heroku:

This app was created as part of the [Bloc](www.bloc.io) Full Stack Web Development course.

# Features

+ A client-side JavaScript snippet that allows a user to track events on their website.
+ A server-side API that captures and saves those events to a database.
+ A Rails application that displays the captured event data for a user.

# Setup and Configuration

**Languages and Frameworks**: Ruby on Rails and Bootstrap

**Ruby version 2.43
**Rails 4.2.5

**Databases**: SQLite (Test, Development), PostgreSQL (Production)

**Development Tools and Gems include**:

+ BCrypt for secure passwords
+ SendGrid for email confirmation
+ Rspec-rails for testing
+ FactoryGirl for test suite success

**Setup:**

+ Environment variables were set using Figaro and are stored in config/application.yml (ignored by git).

+ The config/application.example.yml file illustrates how environment variables should be stored.

**To run Blocmetrics locally:**

+ Clone the repository
+ Run bundle install
+ Create and migrate the SQLite database with `rake db:create` and `rake db:migrate`
+ Start the server using `rails server`
+ Run the app on `localhost:3000`
