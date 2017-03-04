class Employee::Tag < ActiveRecord::Base
  belongs_to(
    :employee,
    inverse_of: :employee_tags,
    foreign_key: :employee_id,
  )

  belongs_to(
    :tag,
    inverse_of: :employee_tags,
    foreign_key: :tag_id,
  )
  # belongs_to(
  #   :department,
  #   class_name: Department.name,
  #   inverse_of: :employees,
  #   foreign_key: :department_id,
  # )
end
