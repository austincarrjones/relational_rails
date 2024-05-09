require 'rails_helper'

#   [ ] done
  # User Story 1, Parent Index 
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system

RSpec.describe "towns index page" do
  context "As a User" do
    describe "when I visit towns index" do
      it "I can see the name of each town record" do
        breck = Town.create!(name: "Breckenridge")
        frisco = Town.create!(name: "Frisco")

        visit "/towns"
        # save_and_open_page
        expect(page).to have_content("Breckenridge")
        expect(page).to have_content("Frisco")
      end
    end
  end
end