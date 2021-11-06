require 'rails_helper'

RSpec.describe "papers/index", type: :feature do
  before(:each) do
    @paper1 = build :paper
    @paper1.year = 1950
    @paper1.save
    @paper2 = build :paper
    @paper2.year = 2000
    @paper2.title = "Test"
    @paper2.save
  end

  it "renders a list of papers" do
    visit papers_path
  end

  it "filters papers by year" do
    visit papers_path(year: 2000)
    expect(page).not_to have_text(@paper1.title)
  end
end
