class Employee < ActiveRecord::Base
  validates_presence_of: :first_name, :last_name

  belongs_to(
    :department,
    class_name: Department.name,
    inverse_of: :employees,
    foreign_key: :department_id,
  )

  has_many(
    :tags,
    foreign_key: :employee_id,
    dependent: :destroy,
    inverse_of: :employee,
  )

  def full_name
    full_name_array = [first_name, last_name]

    full_name_array.compact.join(" ")
  end
end
