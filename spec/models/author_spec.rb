require 'rails_helper'

RSpec.describe Author, type: :model do
  it "should have first name, last name and homepage" do
    author = build :author
    expect(author.first_name).to eq("Alan")
    expect(author.last_name).to eq("Turing")
    expect(author.homepage).to eq("http://wikipedia.de/Alan_Turing")
  end

  it "should return full name" do
    author = build :author
    expect(author.name).to eq("Alan Turing")
  end

  it "should validate first and last name" do
    author = build :author
    author.last_name = nil
    expect(author).to_not be_valid

    author = build :author
    author.first_name = nil
    expect(author).to_not be_valid
  end
end
