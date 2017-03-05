require "rails_helper"

RSpec.describe Employee, type: :model do

  it "is invalid with missing attributes" do
    employee = Employee.new(first_name: nil, last_name: "Davis")
    expect(employee).to_not be_valid
  end

  it "is valid with all attributes" do
    employee = Employee.new({
      first_name: "Justin",
      last_name: "Davis",
      email: "jdavis@gmail.com",
    })
    expect(employee).to be_valid
  end

  it "has one tag" do
    tag = Tag.create!(name: "read")
    employee = Employee.create!(first_name: "Justin",
                                last_name: "Davis",
                                email: "jdavis@gmail.com",
                                tag_ids: [tag.id])
    expect(employee.tag_names).to eq("read")
  end


end
