# WhiteList PAC #

An online proxy auto-config (PAC) file generator, helping bypass Internet limitation in certain countries.

This project is inspired by https://github.com/Leask/Flora_Pac and https://github.com/n0wa11/gfw_whitelist.

### Features ###

* Predefined China Internet whitelist
* Online PAC generator for web browsers and mobile devices, always updated globally
* Easy Heroku deployment

### Usage ###
You should deploy the service locally or use Heroku app, fed with your proxy settings in the query string. Then download the PAC file or set it as proxy auto-config URL.

#### Query string parameters
* proxy: encoded proxy string for non-whitelist URL, default 'DIRECT'
* direct: encoded proxy string for whitelist URL, default 'DIRECT'

#### Local
    bundle install
    ruby ./whitelist-pac.rb -p [PORT]
    wget http://localhost:8080/whitelist.pac?proxy=proxy.example.com%3A8080&direct=DIRECT
    
#### Heroku web app
    wget http://whitelist-pac.herokuapp.com/whitelist.pac?proxy=proxy.example.com%3A8080&direct=DIRECT

### Contribution guidelines ###

* Welcome to contribute to either app or whitelist
* Please provide description or justification in whitelist pull requests

### Copyright ###
Copyright (c) 2014 nkcfan. See [LICENSE][] for details.

[license]: LICENSE.md
