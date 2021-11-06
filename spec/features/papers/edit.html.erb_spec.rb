require 'rails_helper'

RSpec.describe "papers/edit", type: :feature do
  it "renders the edit paper form" do
    @paper = create :paper
    visit edit_paper_path(@paper)

    expect(page).to have_field("paper[title]")
    expect(page).to have_field("paper[venue]")
    expect(page).to have_field("paper[title]")
    expect(page).to have_field("paper[author_ids][]")
  end
end
