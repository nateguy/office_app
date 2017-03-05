class CreateEmployeeTag < ActiveRecord::Migration
  def change
    create_table :employee_tags do |t|
      t.integer :employee_id
      t.integer :tag_id

      t.timestamps null: false
    end

    add_index :employee_tags, :employee_id
    add_index :employee_tags, :tag_id
  end
end
