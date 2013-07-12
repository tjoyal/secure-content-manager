# Secure Content Manager

Managing your servers passwords and sensitive information.

It also comes with minimal authentication and authorization mechanisms.

It is a working but FAR FROM READY FOR PRODUCTION prototype of what I need. Wait or help with it.

## Ideas in the backlog

- Audit
- Backup solution
- Data Types in the form of plugins (external repositories)
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

## Api support

While authorisation is not yet granular enough to only grant access to a specific entry,
access through API call is a good start to remove your clear text passwords from your automated script.

This does not necessarely provide you aditionnal security but it allow password management from a central unified interface.

### Step 1 - Generate your key

In your profile generate an api key for your account.


### Step 2 - Grab the request url

Some fields will have an icon to their right(Arrow in a box). Click this icon to add the url identifier to your clipboard.


### Step 3 - Access the information

Though an http query, by adding your api_key to the request, you can fetch the information required.

        Ex.: curl http://localhost:3000/groups/1/servers/1/keys/1/private_key?api_key=f18a471be5795b9f4d41edbfab5248a2


And this is it!

## License

Released under the [MIT License](http://www.opensource.org/licenses/MIT).
