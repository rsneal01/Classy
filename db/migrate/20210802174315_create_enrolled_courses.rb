class CreateEnrolledCourses < ActiveRecord::Migration[6.1]
  def change
    create_table :enrolled_courses do |t|
      t.integer :course_id
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps
    end
  end
end
