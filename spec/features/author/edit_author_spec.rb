
describe "Edit author page", type: :feature do
  it "should render without error" do
    alan = create :author
    visit edit_author_path(alan)
  end

  it "should have form fields" do
    alan = create :author
    visit edit_author_path(alan)
    expect(page).to have_field("author[first_name]")
    expect(page).to have_field("author[last_name]")
    expect(page).to have_field("author[homepage]")
  end

  it "should save changes" do
    alan = create :author
    visit edit_author_path(alan)

    page.fill_in "author[last_name]", with: "abcd"
    find('input[type="submit"]').click

    alan.reload
    expect(alan.last_name).to eq("abcd") 
  end
end