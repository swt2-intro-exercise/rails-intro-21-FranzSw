
describe "Index authors page", type: :feature do
  it "should exist and render without error" do
    alan = create :author
    visit authors_path
    expect(page).to have_link 'New', href: new_author_path
    expect(page).to have_table
    expect(page).to have_text(alan.name)
    expect(page).to have_text(alan.homepage)
    expect(page).to have_link nil, href: author_path(alan)
    expect(page).to have_link nil, href: edit_author_path(alan)
  end

  it "should delete author on click" do
    alan = create :author
    visit authors_path
    expect(page).to have_link "Delete", href: author_path(alan)
    find("a[data-method='delete'][href='#{author_path(alan)}']").click
  end
end