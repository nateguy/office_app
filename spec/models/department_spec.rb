require "rails_helper"

RSpec.describe Department, type: :model do

  it "is invalid with missing attributes" do
    department = Department.new(name: nil)
    expect(department).to_not be_valid
  end

  it "is valid with all attributes" do
    department = Department.new(name: "nasa")
    expect(department).to be_valid
  end
end
