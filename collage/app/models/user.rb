class User < ApplicationRecord    
  before_save { self.email = email.downcase }
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :name, 
            presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { minimum: 3, maximum: 25 }  
            
  validates :email, 
            presence: true, 
            uniqueness: { case_sensitive: false }, 
            length: { maximum: 105 },
            format: { with: VALID_EMAIL_REGEX }    

  has_secure_password(attribute = :password, validations: true)
  
  has_many :course_users  
  has_many :courses, through: :course_users  
end
