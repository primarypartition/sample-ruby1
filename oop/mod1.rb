# require 'bundler/inline'
 
# gemfile true do
#  source 'http://rubygems.org'
#  gem 'bcrypt'
# end
 
module Mod1
  require 'bcrypt'
  puts "Module Mod1 activated"
 
  def self.create_hash_digest(password)
    BCrypt::Password.create(password)
  end
 
  def self.verify_hash_digest(password)
    BCrypt::Password.new(password)
  end
 
  def self.create_secure_users(list_of_users)
    list_of_users.each do |user_record|
      user_record[:password] = create_hash_digest(user_record[:password])
    end
    list_of_users
  end
 
  def self.authenticate_user(username, password, list_of_users)
    list_of_users.each do |user_record|
      if user_record[:username] == username && verify_hash_digest(user_record[:password]) == password
        return user_record
      end
    end
    return "Credentials were not correct"
  end
end
