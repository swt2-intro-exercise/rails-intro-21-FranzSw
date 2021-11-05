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
  end
end
