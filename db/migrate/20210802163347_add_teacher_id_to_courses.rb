class AddTeacherIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :teacher_id, :integer
  end
end
