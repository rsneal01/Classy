class Student < ApplicationRecord
    has_secure_password
    has_many :teachers, through: :classes
    has_many :classes
end
