class RemoveStudentIdFromCourses < ActiveRecord::Migration[6.1]
  def change
    remove_column :courses, :student_id, :integer
  end
end
