class Student < ApplicationRecord
    has_many :teachers, through: :enrolled_courses
    has_many :enrolled_courses
    validates :name, presence: true
    validates :grade, presence: true
    scope :unenrolled, -> { where(enrolled: false) }
    scope :unenrolled_and_in_middle, -> { unenrolled.where("grade >= 6") }
    after_initialize :set_defaults, unless: :persisted?

    def set_defaults
        self.enrolled ||= false
    end
    # binding.pry
    # scope :enrolled_in_current_teacher, -> { enrolled.where(self.enrolled_courses.include?(current_user.enrolled_courses)) } 
    
end
