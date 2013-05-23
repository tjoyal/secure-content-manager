# Secure Content Manager

Managing your servers passwords and sensitive information.

It also comes with minimal authentification and authorization mechanisms.

It is a working but FAR FROM READY FOR PRODUCTION prototype of what I need. Wait or help with it.

## Ideas in the backlog

- Audit
- Backup solution
- Cancan
- Copy to clip directly(timed)
- Data Types in the form of plugins (external repositories)
- Encrypt in database
- Toggle Visibility of sensitive information
- Some mode data types
- etc...

## Getting Started

1. Get the code

        git clone git@github.com:tjoyal/secure_content_manager.git

2. Run the database setup operations

        rake db:create db:migrate db:seed

3. Go to http://localhost:3000 and you'll be in business!

    The initial user credentials are :

        Email:    test@exemple.com
        Password: testtest

## License

Released under the [MIT License](http://www.opensource.org/licenses/MIT).