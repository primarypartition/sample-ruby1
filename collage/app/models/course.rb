class Course < ApplicationRecord
  validates :short_name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :name, presence: true, length: { minimum: 6, maximum: 100 }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 } 

  has_many :course_users	
	has_many :users, through: :course_users
end
