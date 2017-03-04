class Employee < ActiveRecord::Base
  belongs_to :department,
      class_name: Department.name,
      inverse_of: :employees,
      foreign_key: :department_id

  has_many :tags,
           dependent: :destroy,
           inverse_of: :employee,
           class_name: Employee.name
end
