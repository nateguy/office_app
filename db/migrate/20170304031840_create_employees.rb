class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :department_id

      t.timestamps null: false
    end

    add_index :employees, :first_name
    add_index :employees, :last_name
    add_index :employees, :department_id
  end
end
