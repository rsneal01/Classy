class Student < ApplicationRecord
    # has_secure_password
    has_many :teachers, through: :enrolled_courses
    has_many :enrolled_courses
    # has_secure_password
end
