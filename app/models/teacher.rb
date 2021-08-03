class Teacher < ApplicationRecord
    # has_secure_password
    has_many :students, through: :enrolled_courses
    has_many :enrolled_courses
    has_many :courses
    # has_secure_password
end
