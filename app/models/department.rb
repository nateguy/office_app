class Department < ActiveRecord::Base
  validates_presence_of :name

  has_many(
    :employees,
    foreign_key: :department_id,
    dependent: :destroy,
    inverse_of: :department,
  )

  def employee_size
    employees.size
  end
end
