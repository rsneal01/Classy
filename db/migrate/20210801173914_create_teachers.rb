class CreateTeachers < ActiveRecord::Migration[6.1]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :password
      t.string :password_digest
      t.text :schedule
      t.boolean :admin

      t.timestamps
    end
  end
end
