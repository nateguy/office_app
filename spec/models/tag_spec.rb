require "rails_helper"

RSpec.describe Tag, type: :model do

  it "is invalid with missing attributes" do
    tag = Tag.new(name: nil)
    expect(tag).to_not be_valid
  end

  it "is valid with all attributes" do
    tag = Tag.new(name: "Moon")
    expect(tag).to be_valid
  end
end
