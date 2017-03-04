class Employee < ActiveRecord::Base
  validates_presence_of :first_name, :last_name

  belongs_to(
    :department,
    class_name: Department.name,
    inverse_of: :employees,
    foreign_key: :department_id,
  )

  has_many(
    :employee_tags,
    class_name: "::#{Employee::Tag.name}",
    foreign_key: :employee_id,
    dependent: :delete_all,
  )

  def full_name
    full_name_array = [first_name, last_name]

    full_name_array.compact.join(" ")
  end
end
