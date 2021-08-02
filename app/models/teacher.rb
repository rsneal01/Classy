class Teacher < ApplicationRecord
    # has_secure_password
    has_many :students, through: :courses
    has_many :courses
end
