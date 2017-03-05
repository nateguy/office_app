class Tag < ActiveRecord::Base
  validates_presence_of :name

  has_many(
    :employee_tags,
    class_name: "::#{EmployeeTag.name}",
    foreign_key: :tag_id,
    dependent: :delete_all,
  )
end
