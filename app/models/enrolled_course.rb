class EnrolledCourse < ApplicationRecord
    belongs_to :student
    belongs_to :teacher
    belongs_to :course

    # def course_name
    # end

end
