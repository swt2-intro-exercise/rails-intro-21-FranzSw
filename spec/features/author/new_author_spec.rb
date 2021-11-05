require 'rails_helper'

describe "New author page", type: :feature do
  it "should exist at 'new_author_path' and render without error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit new_author_path
  end

  describe "form", type: :feature do
    before(:each) do
      visit new_author_path
    end

    it "should have a text input for author's first name" do
      expect(page).to have_field("author[first_name]")
    end
  
    it "should have a text input for author's last name" do
      expect(page).to have_field("author[last_name]")
    end
  
    it "should have a text input for author's home page" do
      expect(page).to have_field("author[homepage]")
    end

    it "should save new author" do
      visit new_author_path
      page.fill_in 'author[first_name]', with: 'Edsger'
      page.fill_in 'author[last_name]', with: 'Dijkstra'
      page.fill_in 'author[homepage]', with: 'https://en.wikipedia.org/wiki/Edsger_W._Dijkstra'
      find('input[type="submit"]').click
    end

    it "should show error if invalid" do
      visit new_author_path
      page.fill_in 'author[first_name]', with: 'Edsger'
      page.fill_in 'author[last_name]', with: nil
      page.fill_in 'author[homepage]', with: 'https://en.wikipedia.org/wiki/Edsger_W._Dijkstra'
      find('input[type="submit"]').click
      
      expect(page).to have_text("error")
      expect(page).to have_text("can't be blank")
    end
  end
end
