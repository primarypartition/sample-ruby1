# Ruby and Ruby on Rails Dev Project


## Project Urls


### Blog 

> https://sample-ruby1-blog.herokuapp.com/

### GalaBata

> https://sample-ruby1-galabata.herokuapp.com/

### MainStreet

> https://sample-ruby1-mainstreet.herokuapp.com/


## Commands

```
> rails -v
> ruby -v
> rails g controller messages
> rails g model message
> rails routes -c messages
> rails db:migrate
> rails console
> rails server
> rails db:seed
> rails c
> rails s
> rails g migration create_table
> rails g channel Chatee
> rails credentials:edit 
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

## Random Issues

```
echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p

```
