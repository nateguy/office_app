class CreateDepartments < ActiveRecord::Migration
  def change
    create_table :departments do |t|
      t.string :name

      t.timestamps null: false
    end

    add_index :departments, :name
  end
end
