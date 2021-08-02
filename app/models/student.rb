class Student < ApplicationRecord
    # has_secure_password
    has_many :teachers, through: :courses
    has_many :courses
end
