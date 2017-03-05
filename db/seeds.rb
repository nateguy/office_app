# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Department.destroy_all
Employee.destroy_all
Tag.destroy_all

Department.create([
  { name: "Planets" },
  { name: "Stars" },
])

Tag.create([
  { name: "Jupiter" },
  { name: "Mars" },
  { name: "Alpha Centauri" },
])

employee_list = [
  {
    first_name: "Darth",
    last_name: "Vader",
    email: "darthvader@gmail.com",
    department_id: Department.first.id,
    tag_ids: [Tag.first.id],
  },
  {
    first_name: "John",
    last_name: "Bajorans",
    email: "johnbaj@gmail.com",
    department_id: Department.last.id,
    tag_ids: [Tag.first.id, Tag.last.id],
  }
]

employee_list.each do |employee|
  Employee.create({
    first_name: employee[:first_name],
    last_name: employee[:last_name],
    email: employee[:email],
    department: Department.find(employee[:department_id]),
    tag_ids: employee[:tag_ids],
  })
end
