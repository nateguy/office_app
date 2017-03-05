class EmployeeTag < ActiveRecord::Base
  belongs_to(
    :employee,
    class_name: "::#{Employee.name}",
    inverse_of: :employee_tags,
    foreign_key: :employee_id,
  )

  belongs_to(
    :tag,
    class_name: "::#{Tag.name}",
    inverse_of: :employee_tags,
    foreign_key: :tag_id,
  )
end
