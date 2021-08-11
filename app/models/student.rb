class Student < ApplicationRecord
    has_many :teachers, through: :enrolled_courses
    has_many :enrolled_courses
    validates :name, presence: true
end
