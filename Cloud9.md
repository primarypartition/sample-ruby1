# Ruby on Rails Setup on AWS Cloud9


## Ruby

```
ruby -v
rvm list rubies
rvm list known
```


## NodeJs

```
nodejs -v
node -v
```


## Yarn

```
yarn -v

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

sudo apt update && sudo apt install yarn

sudo apt update && sudo apt install --no-install-recommends yarn
```


## Gem bundler

```
gem list bundler
gem update bundler
```


## Rails

```
gem list rails
rails -v
gem install rails
```


## Rails project run

```
rails new blog
cd blog
rails s

vim /blog/config/environments/development.rb
config.hosts << "xxxxxxxxxxxxxxxxxxxxxxxxxxx.vfs.cloud9.us-east-2.amazonaws.com"
```
