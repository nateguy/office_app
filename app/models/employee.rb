require "contracts"

class Employee < ActiveRecord::Base
  include Contracts::Core
  include Contracts::Builtin

  validates_presence_of :first_name, :last_name

  attr_reader :tag_ids

  belongs_to(
    :department,
    class_name: Department.name,
    inverse_of: :employees,
    foreign_key: :department_id,
  )

  has_many(
    :employee_tags,
    class_name: "::#{EmployeeTag.name}",
    foreign_key: :employee_id,
    dependent: :delete_all,
  )


  def full_name
    full_name_array = [first_name, last_name]

    full_name_array&.compact&.join(" ")
  end

  def tag_names
    Tag.where(id: tag_ids).map do |tag|
      tag.name
    end.join(", ")
  end

  def tag_ids
    employee_tags.map do |employee_tag|
      employee_tag&.tag&.id
    end.compact
  end

  Contract Or[String, CollectionOf[Array, Or[String, Integer]]] => Any
  def tag_ids=(tag_id_values)
    # String input is mainly caused by incorrect hidden input,
    # and the value should be ignored whatever the content is
    employee_tags.clear

    if tag_id_values.is_a?(String)
      return
    end

    found_tags = Tag.where(id: tag_id_values)
    found_tags.each do |found_tag|
      employee_tags << EmployeeTag.new({
        employee: self,
        tag: found_tag,
      })
    end
  end
end
