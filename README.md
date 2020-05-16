# Ruby and Ruby on Rails Dev Project


## Project Urls


### Blog App

> https://sample-ruby1-blog.herokuapp.com/

### GalaBata (Chat App)

> https://sample-ruby1-galabata.herokuapp.com/

### MainStreet (Stock Market App)

> https://sample-ruby1-mainstreet.herokuapp.com/

### Tasweer (Photo App)

> https://sample-ruby1-tasweer.herokuapp.com/


## Commands

```
> rails -v
> ruby -v
> rails g controller messages
> rails g model message
> rails routes -c messages
> rails routes | grep user
> rails db:migrate
> rails console
> rails server
> rails db:seed
> rails c
> rails s
> rails g migration create_table
> rails g channel Chatee
> rails credentials:edit 
> EDITOR=vim rails credentials:edit
> rails generate bootstrap:install static
> rails generate bootstrap:layout application
> rails generate devise:install
> rails generate devise User
> rails generate devise:views:locale en
> rails generate devise:views:bootstrap_templates
> bundle install
> bundle install --without production

```


## Secret Credentials Config

> Config config/credentials.yml.enc File

```
rails credentials:edit 
or
EDITOR=vim rails credentials:edit

iex_client:
        sandbox_api_key: Tpk_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        sandbox_api_secret: Tsk_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

> Test/Use on console

```
Rails.application.credentials.iex_client[:sandbox_api_key]
Rails.application.credentials.iex_client[:sandbox_api_secret]
```

> Heroku Config for config/master.key

```
heroku config:set RAILS_MASTER_KEY=<your-master-key>
heroku config:set RAILS_MASTER_KEY="$(< config/master.key)"
```


## Email sendgrid API


### Heroku Email Enable

> heroku addons:create sendgrid:starter

### Access sendgrid API from Heroku app dashboard

> https://app.sendgrid.com/

### Get API Key

> sendgrid > settings > API Keys

```
heroku config:set SENDGRID_USERNAME=sg_apikey

heroku config:set SENDGRID_PASSWORD=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx

heroku config:get SENDGRID_USERNAME

heroku config
```

### Config Rails App for API

> Add lines in config/environments/development.rb

```
config.action_mailer.delivery_method = :test
config.action_mailer.default_url_options = { :host => 'http://192.168.33.100:3000'}
```

> Add lines in config/environments/production.rb

````
config.action_mailer.delivery_method = :smtp
config.action_mailer.default_url_options = { :host => 'https://sample-ruby1-tasweer.herokuapp.com', :protocol => 'https'}
```
> Add lines in config/environment.rb

```
ActionMailer::Base.smtp_settings = {
  :address => 'smtp.sendgrid.net',
  :port => '587',
  :authentication => :plain,
  :user_name => ENV['SENDGRID_USERNAME'],
  :password => ENV['SENDGRID_PASSWORD'],
  :domain => 'sample-ruby1-tasweer.herokuapp.com',
  :enable_starttls_auto => true
}
````

### Rails config secret local env file  

> touch config/local_env.yml
> Add lines in config/local_env.yml

```
SENDGRID_USERNAME: apikey (DO NOT CHANGE IT)
SENDGRID_PASSWORD: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
SENDGRID_API_KEY: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

> Add line in .gitignore 
```
config/local_env.yml
```

> Add lines in config/application.rb
```
config.before_configuration do
  env_file = File.join(Rails.root, 'config', 'local_env.yml')
  YAML.load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] = value
  end if File.exists?(env_file)
end
```

## Random Issues

```
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

```


## Stripe


### Stripe API 

> https://stripe.com/
> https://stripe.com/docs/legacy-checkout/rails
> https://stripe.com/docs

```
Enable "Viewing test data"
Developers > API keys > Test API Keys
```

### gem Install

> Gemfile 

```
gem 'stripe'
bundle install --without production
```

### config/initializers/stripe.rb

```
Rails.configuration.stripe = {
  :publishable_key => ENV['STRIPE_TEST_PUBLISHABLE_KEY'],
  :secret_key => ENV['STRIPE_TEST_SECRET_KEY']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
```

### config/local_env.yml

> touch config/local_env.yml
> Add lines in config/local_env.yml

```
STRIPE_TEST_PUBLISHABLE_KEY: "xxxxxxxxxxxxxxxxxxxxxx"
STRIPE_TEST_SECRET_KEY: "xxxxxxxxxxxxxxxxxxxxxxxxxxx"
```

> Add line in .gitignore 

```
config/local_env.yml
```

> Add lines in config/application.rb

```
config.before_configuration do
  env_file = File.join(Rails.root, 'config', 'local_env.yml')
  YAML.load(File.open(env_file)).each do |key, value|
    ENV[key.to_s] = value
  end if File.exists?(env_file)
end
```

### Heroku config

```
heroku config:set STRIPE_TEST_PUBLISHABLE_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
heroku config:set STRIPE_TEST_SECRET_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

### Testing

> https://stripe.com/docs/testing

```
Test credit card: 4242 4242 4242 4242 
```
