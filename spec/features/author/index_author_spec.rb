
describe "Index authors page", type: :feature do
  it "should exist and render without error" do
    alan = create :author
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
    expect(page).to have_table
    expect(page).to have_text(alan.name)
    expect(page).to have_text(alan.homepage)
    expect(page).to have_link nil, href: author_path(alan)
    expect(page).to have_link nil, href: author_edit_path(alan)
  end
end