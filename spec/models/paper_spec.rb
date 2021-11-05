require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should not be valid wihtout title" do
    paper = build :paper
    paper.title = nil
    expect(paper).to_not be_valid
  end

  it "should not be valid without venue" do
    paper = build :paper
    paper.venue = nil
    expect(paper).to_not be_valid
  end

  it "should not be valid without (numeric) year" do
    paper = build :paper
    paper.year = nil
    expect(paper).to_not be_valid
    paper.year = "test"
    expect(paper).to_not be_valid
  end

  it "should be valid if title, venue and year are given" do
    paper = build :paper
    expect(paper).to be_valid
  end

  it "should have authors list" do
    paper = build :paper
    expect(paper.authors).not_to be_empty
  end
end
