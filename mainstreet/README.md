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

> https://sample-ruby1-mainstreet.herokuapp.com/


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


## Bootstrap setup

```
yarn add bootstrap@4.4.1 jquery popper.js

```


### Edit app/assets/stylesheets/application.css

Add line

> *= require bootstrap
 
 
### Edit config/webpack/environment.js

```
const { environment } = require('@rails/webpacker')

const webpack = require("webpack")

environment.plugins.append("Provide", new webpack.ProvidePlugin({

$: 'jquery',

jQuery: 'jquery',

Popper: ['popper.js', 'default']

}))

module.exports = environment
```


### Edit app/javascript/packs/application.js

Add line in bottom

> import "bootstrap"


### Add custom scss file app/assets/stylesheets/custom.css.scss

> touch app/assets/stylesheets/custom.css.scss

```
@import 'bootstrap/dist/css/bootstrap';

.navbar {

background-color: #FDF6EA !important;

}
```


## Devise and Devise Views gems

> https://github.com/heartcombo/devise

```
gem 'devise'
bundle install

rails generate devise:install
rails generate devise User
rails db:migrate

> ApplicationController
> UserModel
```

> https://github.com/hisea/devise-bootstrap-views

```
gem 'devise-bootstrap-views', '~> 1.0'
bundle install

rails generate devise:views:bootstrap_templates
```

## iex API and Rails Credentials


### Gem

> https://github.com/dblock/iex-ruby-client

```
gem 'iex-ruby-client'

```

> bundle install

### Sign up API

> https://iexcloud.io/

> rails c

```
client = IEX::Api::Client.new(
  publishable_token: 'publishable_token',
  secret_token: 'secret_token',
  endpoint: 'https://sandbox.iexapis.com/v1'
)

client.price('AAPL')
```

### Rails Credentials

> Setup class method

```
client = IEX::Api::Client.new(
      publishable_token: Rails.application.credentials.iex_client[:sandbox_api_key],
      secret_token: Rails.application.credentials.iex_client[:sandbox_api_secret],
      endpoint: 'https://sandbox.iexapis.com/v1'
    )

```

> Config config/credentials.yml.enc File

```
rails credentials:edit 
or
EDITOR=vim rails credentials:edit

iex_client:
        sandbox_api_key: Tpk_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
        sandbox_api_secret: Tsk_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

> Test on console

```
Rails.application.credentials.iex_client[:sandbox_api_key]
Rails.application.credentials.iex_client[:sandbox_api_secret]
```

> Heroku Config for config/master.key

```
heroku config:set RAILS_MASTER_KEY=<your-master-key>
heroku config:set RAILS_MASTER_KEY="$(< config/master.key)"
```
