class Tag < ActiveRecord::Base
  validates_presence_of: :name
  
  belongs_to(:employee,
    class_name: Employee.name,
    inverse_of: :tags,
    foreign_key: :employee_id,
  )
end
