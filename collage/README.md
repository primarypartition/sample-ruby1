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

rails new collage

sudo apt-get install nodejs -y

gem uninstall yarn

npm install yarn

rails webpacker:install

yarn --version

npm install brew -g

brew install yarn

rails s -b 192.168.33.100 -p 3000

sqlite3 --version

git init

git remote add ssh git@github.com:primarypartition/sample-ruby1.git

git remote -v

git add .

git commit -m "new app"

git branch

git push --set-upstream origin master

ssh-keygen

cat ~/.ssh/id_rsa.pub

```


## Heroku deployment

> heroku.com

```
sudo snap install --classic heroku

curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

heroku login -i

heroku create sample-ruby1-collage

```

> https://sample-ruby1-collage.herokuapp.com/

```
git add .

git commit -m "heroku deployment"

git push heroku master

heroku open

heroku logs

heroku logs --tail

heroku run rails console

heroku run rails db:migrate

heroku rename sample-ruby1-collage
```


## Rails server on ubuntu vagrant machine

> http://192.168.33.100:3000/

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
