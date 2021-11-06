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

  it "should save updated authors" do
    # Ensure that atleast one, unique author is shown
    @author = build :author
    @author.first_name = "EditPaperUpdateAuthorTest"
    @author.save

    @paper = create :paper
    visit edit_paper_path(@paper)
    
    # Select the author
    select @author.name, :from => "paper[author_ids][]"
    find('input[type="submit"]').click

    @paper.reload
    expect(@paper.authors).to include(@author)
  end
end
