class Teacher < ApplicationRecord
    has_secure_password
    has_many :students, through: :classes
    has_many :classes
end
