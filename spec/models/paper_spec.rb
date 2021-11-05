require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should not be valid wihtout title" do
    paper = build :paper
    paper.title = nil
    expect(paper).to_not be_valid
  end
end
