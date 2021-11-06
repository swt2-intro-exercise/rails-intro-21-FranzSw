# require 'rails_helper'

describe "papers/show", type: :feature do
  it "renders attributes in <p>" do
    @paper = create :paper
    visit paper_path(@paper)
    expect(page).to have_text(@paper.title)
    expect(page).to have_text(@paper.venue)
    expect(page).to have_text(@paper.year)
  end

  it "renders authors full name" do
    @author = create :author
    @paper = create :paper
    # expect(@author).to eq(1)
    @paper.authors << @author
    @paper.save

    visit paper_path(@paper)
    expect(page).to have_text(@author.name)
  end
end
