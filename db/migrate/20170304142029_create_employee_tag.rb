class CreateEmployeeTag < ActiveRecord::Migration
  def change
    create_table :employee_tags do |t|
      t.integer :employee_id
      t.integer :tag_id

      t.timestamps null: false
    end
  end
end
