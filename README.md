# Shelly Cloud Example App

This is an example application showcasing the possibilities of the [Shelly Cloud PaaS](https://shellycloud.com/).

## Deployment instructions

1) Install the `shelly` gem

    $ gem install shelly

2) Create an account

    $ shelly register

3) Confirm your account and log in

    $ shelly login

4) Create a cloud for your app

    $ shelly add --databases=postgresql,mongodb,redis --size=small

5) Add required services to the Cloudfile:

    your-code-name:
      ruby_version: 2.0.0 # 2.0.0, jruby, 1.9.3, 1.9.2 or ree-1.8.7
      environment: production # RAILS_ENV
      monitoring_email: you@example.com
      domains:
        - shelly-example-app.shellyapp.com
      servers:
        app1:
          size: small
          puma: 1
          sidekiq: 1
          clockwork: on
          elasticsearch: on
          databases:
            - postgresql
            - mongodb
            - redis

6) Start your cloud

    $ git push shelly master
    $ shelly start
