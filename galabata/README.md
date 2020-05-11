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

> https://sample-ruby1-galabata.herokuapp.com/


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

heroku run rake db:migrate

heroku rename sample-ruby1-galabata
```


## Rails server on ubuntu vagrant machine

```
rails s -b 192.168.33.100 -p 3000

```


## Add custom scss file app/assets/stylesheets/custom.css.scss

> touch app/assets/stylesheets/custom.css.scss


## Semantic UI

> https://github.com/doabit/semantic-ui-sass

> update Gemfile or use yarn method

```
gem 'semantic-ui-sass'
gem 'jquery-rails'

```

> bundle install --without production


## Web Socket - Channel

> rails g channel chatroom


### Enable action cable URL in config/environment/production.rb or in development.rv

Add one of these lines

> config.action_cable.disable_request_forgery_protection = true
or
> config.action_cable.allowed_request_origins = ['https://sample-ruby1-galabata.herokuapp.com']
  