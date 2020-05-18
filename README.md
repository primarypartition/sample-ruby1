# Ruby and Ruby on Rails Dev Projects


## Project URLs


### Blog App

> https://sample-ruby1-blog.herokuapp.com/

### GalaBata (Chat App)

> https://sample-ruby1-galabata.herokuapp.com/

### MainStreet (Stock Market App)

> https://sample-ruby1-mainstreet.herokuapp.com/

### Tasweer (Photo App)

> https://sample-ruby1-tasweer.herokuapp.com/

### Proman (Saas Project App)

> https://sample-ruby1-proman.herokuapp.com/

### Collage (Frontend UI Project App)

> https://sample-ruby1-collage.herokuapp.com/


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
> rails g bootstrap:install static
> rails g bootstrap:layout application
> rails g devise:install
> rails g devise User
> rails g devise:views:locale en
> rails g devise:views:bootstrap_templates
> bundle install
> bundle install --without production
> rails g bootstrap:themed Images
> rails generate uploader Picture
> rails db:create db:migrate
> rails new proman -d postgresql
> rails g controller pages home
> rails g scaffold Image name:string picture:string user:references
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
heroku config:set SENDGRID_USERNAME=apikey

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

sudo apt-get --purge remove postgresql postgresql-doc postgresql-common
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


## Image gems and libs

> sudo apt-get install build-essential libcurl4-openssl-dev gcc libxml2-dev ruby ruby-dev -y
> sudo apt-get update
> sudo apt-get upgrade -y
> sudo apt-get install imagemagick --fix-missing

```
gem 'carrierwave'
gem 'mini_magick'

bundle install
```

> Uploader config

```
include CarrierWave::MiniMagick
process resize_to_limit: [300, 300]
```


## Cloud Storage i.e S3


### gem install

```
gem 'fog'

bundle install
```


### Uploader config`

```
if Rails.env.production?
  storage :fog
else
  storage :file
end
```


### Create aws IAM user and S3 Bucket

> https://aws.amazon.com/premiumsupport/knowledge-center/s3-console-access-certain-bucket/

1) Create IAM user
2) Create S3 bucket
3) Create policy with s3 bucket details

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::xxxxxxx",
                "arn:aws:s3:::xxxxxxx/*"
            ]
        },
        {
            "Effect": "Allow",
            "Action": [
                "s3:PutObject",
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::xxxxxxx",
                "arn:aws:s3:::xxxxxxx/*"
            ]
        }
    ]
}
```

4) Attach policy to IAM user created


### Heroku config

```
heroku config:set S3_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxxxx
heroku config:set S3_SECRET_KEY=xxxxxxxxxxxxxxxxxxxxxxxxxxxxx
heroku config:set S3_BUCKET=xxxxxxxxxxxxxxxxxxxxxxxx
heroku config:set S3_BUCKET_REGION=xxxxxxxxxxxxxxx
```


### config/initializers

> https://www.rubydoc.info/gems/carrierwave/CarrierWave/Storage/Fog

```
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV['S3_ACCESS_KEY'],
      :aws_secret_access_key => ENV['S3_SECRET_KEY'],
      :region => ENV['S3_BUCKET_REGION']
    }

    config.fog_directory = ENV['S3_BUCKET']
    config.fog_public = true
  end
end
```


# postgres setup 


### Install

```
rails new proman -d postgresql

cd proman
yarn install --check-files

sudo apt-get update
sudo apt-get upgrade

sudo apt install postgresql postgresql-contrib libpq-dev
sudo -u postgres psql -c "SELECT version();"

sudo -u postgres createuser -s vagrant
sudo -u postgres psql
\password vagrant 
CREATE DATABASE proman_development;
\list
\q
```


### Config config/database.yml

```
database: <%= ENV['PG_DATABASE_NAME'] %>
username: <%= ENV['PG_DATABASE_USER'] %> 
password: <%= ENV['PG_DATABASE_PASS'] %>
```

### Rails config secret local env file  

> touch config/local_env.yml
> Add lines in config/local_env.yml

```
PG_DATABASE_NAME: apikey (DO NOT CHANGE IT)
PG_DATABASE_USER: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
PG_DATABASE_PASS: xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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


## Materialize 

> https://materializecss.com/

```
yarn add materialize-css
```

### Add app/javascript/packs/application.js

```
import 'materialize-css/dist/js/materialize'
```

### Add app/assets/stylesheets/materialize.scss

```
@import ‘materialize-css/dist/css/materialize’;
```

