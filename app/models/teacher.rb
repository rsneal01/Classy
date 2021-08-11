class Teacher < ApplicationRecord
    has_many :students, through: :enrolled_courses
    has_many :enrolled_courses
    has_many :courses
    has_secure_password
    validates :name, presence: true
    validates :password, presence: true
    validates :bio, length: { minimum: 5 }
end
