# Project README


## vagrant machine

```
Vagrant.configure("2") do |config|
  
  config.vm.define "master" do |master|
    master.vm.hostname = "master"
    master.vm.box = "bento/ubuntu-18.04"    
    master.vm.network "private_network", ip: "192.168.33.100"

    master.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
      vb.cpus = 2
    end

  end
end

```

> http://192.168.33.100:3000/


## vagrant machine setup

```
sudo apt-get update -y

sudo apt-get upgrade -y

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB

curl -sSL https://get.rvm.io | bash -s stable --ruby

source /home/vagrant/.rvm/scripts/rvm

rvm version

rvm get stable --autolibs=enable

usermod -a -G rvm root

rvm list known

rvm install ruby-2.5.1

rvm --default use ruby-2.5.1

ruby -v

curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -

sudo apt-get install git -y

sudo apt-get install gcc g++ make -y

gem update --system

gem -v

gem update --system

echo "gem: --no-document" >> ~/.gemrc

gem install rails

rails -v

sudo apt install postgresql postgresql-contrib libpq-dev -y

irb

ip addr

rails new blog

sudo apt-get install nodejs -y

gem uninstall yarn

npm install yarn

rails webpacker:install

yarn --version

npm install brew -g

brew install yarn

rails s -b 192.168.33.100 -p 3000

http://192.168.33.100:3000/

sqlite3 --version

git init

git remote add origin https://github.com/primarypartition/sample-ruby1.git

git remote -v

git add .

commit -m "new app"

git branch

git pull

git pull origin master --allow-unrelated-histories

git status

git push

git push --set-upstream origin master

ssh-keygen

cat ~/.ssh/id_rsa.pub

git remote -v

git remote add ssh git@github.com:primarypartition/sample-ruby1.git

git remote -v

```


## Heroku deployment

> heroku.com

```
sudo snap install --classic heroku

curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

heroku login -i

heroku create 

```

> https://sample-ruby1-tasweer.herokuapp.com/


## Gemfile update

```
group :production do
  gem 'pg'
end

```

> search and move => gem 'sqlite3', '~> 1.4'

```
group :development, :test do
  #Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'sqlite3', '~> 1.4'
end

bundle install --without production

git add .

git commit -m "heroku deployment"

git push heroku master

heroku open

heroku logs

heroku logs --tail

heroku run rails console

heroku run rails db:migrate

heroku rename sample-ruby1-mainstreet
```


## Rails server on ubuntu vagrant machine

```
rails s -b 192.168.33.100 -p 3000

```


## Add custom scss file app/assets/stylesheets/custom.css.scss

> touch app/assets/stylesheets/custom.css.scss


## Devise and Devise Views gems

> https://github.com/heartcombo/devise

```
gem 'devise'

bundle install

rails generate devise:install
rails generate devise User
rails db:migrate

> Application Controller
> User Model
> User Migration
```

> https://github.com/hisea/devise-bootstrap-views


## Bootstrap Theme

```
gem 'twitter-bootstrap-rails'
gem 'devise-bootstrap-views'
gem 'jquery-rails'

bundle install

rails generate bootstrap:install static
rails generate bootstrap:layout application
rails generate devise:views:locale en
rails generate devise:views:bootstrap_templates
```

### For particular resource i.e Images

> rails g bootstrap:themed Images


### Fix Errors

```
> Edit file: 

app/assets/javascripts/application.js

> Add lines: 

//= require jquery_ujs
//= require jquery
//= require twitter/bootstrap
//= require turbolinks
//= require_tree .

> Edit file: 

app/assets/config/manifest.js

> Add line: 

//= link application.js

> Edit file: 

app/views/layouts/application.html.erb

> Remove all 5 favicon tags
```


## Email sendgrid API


### Heroku Email Enable

> heroku addons:create sendgrid:starter

### Access sendgrid API from Heroku app dashboard

> https://app.sendgrid.com/

### Get API Key

> sendgrid > settings > API Keys

```
heroku config:set SENDGRID_USERNAME=apikey (DO NOT CHANGE)
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
