class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :password
      t.string :password_digest
      t.text :schedule
      t.boolean :admin

      t.timestamps
    end
  end
end
