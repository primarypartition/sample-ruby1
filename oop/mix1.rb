require_relative 'mod2'
 
class Student
  include Mod2
  attr_accessor :first_name, :last_name, :email, :username, :password
 
  def initialize(firstname, lastname, username, email, password)
    @first_name = firstname
    @last_name = lastname
    @username = username
    @email = email
    @password = password
  end
 
  def to_s
    "First name: #{@first_name}, Last name: #{@last_name}, Username: #{@username},
                  email address: #{@email}"
  end
 
end
 
john = Student.new("John", "Doe", "john1", "john1@example.com",
                      "password2")
 
john_password = john.create_hash_digest(john.password)
 
puts john_password

