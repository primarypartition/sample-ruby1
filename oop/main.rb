require_relative 'mod1'

# $LOAD_PATH << "."
# require 'mod1'

users = [
          { username: "mary", password: "password1" },
          { username: "jack", password: "password2" },
          { username: "anna", password: "password3" },
          { username: "joe", password: "password4" },
          { username: "smith", password: "password5" }
        ]

puts Mod1.create_secure_users(users)
