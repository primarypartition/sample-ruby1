require 'bcrypt'
 
users = [
          { username: "mary", password: "password1" },
          { username: "jack", password: "password2" },
          { username: "anna", password: "password3" },
          { username: "joe", password: "password4" },
          { username: "smith", password: "password5" }
        ]
 
def create_hash_digest(password)
  BCrypt::Password.create(password)
end
 
def verify_hash_digest(password)
  BCrypt::Password.new(password)
end
 
def create_secure_users(list_of_users)
  list_of_users.each do |user_record|
    user_record[:password] = create_hash_digest(user_record[:password])
  end
  list_of_users
end
