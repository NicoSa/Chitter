Chitter
===
This project represents two weekend challenges at Makers Academy, London(Week 6 and Week 7). What you should see is a basic Twitter style app. You can signup, login, recover your password and post to a public board. All the frontend design was done without Twitter Bootstrap.
![](public/chitter.png)

Heroku
----
[App on Heroku]

Objectives of exercise
----
Making a fully functioning Mini-Twitter clone as well as imitating the frontend feel and look of the original utilizing various technologies.

Technologies used
----
- Ruby
- Sinatra
- HTML5
- CSS3
- Git
- Heroku
- Postgresql
- jQuery
- Javascript
- Rspec
- Capybara
- Bcrypt
- [Mailgun API]
- Datamapper

How to run it
----
```sh
git clone https://github.com/NicoSa/Chitter
cd Chitter/lib
shotgun -p 3000 chitter.rb
```
open localhost:3000 in your browser

How to run tests
----
```sh
cd Chitter
rspec
```
[App on Heroku]:http://chitter3000.herokuapp.com
[Mailgun API]:http://documentation.mailgun.com/quickstart.html
