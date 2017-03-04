class Department < ActiveRecord::Base
  has_many :employees,
           dependent: :destroy,
           inverse_of: :department,
           class_name: Department.name
end
