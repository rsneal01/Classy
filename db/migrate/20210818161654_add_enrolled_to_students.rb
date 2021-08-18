class AddEnrolledToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :enrolled, :boolean
  end
end
