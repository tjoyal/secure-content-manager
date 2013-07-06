# Secure Content Manager

Managing your servers passwords and sensitive information.

It also comes with minimal authentication and authorization mechanisms.

It is a working but FAR FROM READY FOR PRODUCTION prototype of what I need. Wait or help with it.

## Ideas in the backlog

- Audit
- Backup solution
- Data Types in the form of plugins (external repositories)
- Get data via easy to use api
- Some more data types
- etc...

## Getting Started

1. Get the code

    git clone git@github.com:tjoyal/secure_content_manager.git

2. Run the database setup operations

    rake db:create db:migrate db:seed

3. Start the server

    rails s

4. Go to http://localhost:3000 and you'll be in business!

    The system will ask you to create your initial admin user on first use

## License

Released under the [MIT License](http://www.opensource.org/licenses/MIT).
