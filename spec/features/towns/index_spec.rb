require 'rails_helper'

RSpec.describe "towns index page" do
  #   [ ] done
  # User Story 1, Parent Index 
  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system

  context "As a User" do
    describe "when I visit towns index" do
      it "I can see the name of each town record" do
        visit "/towns"
        expect(page).to have_content("Towns")
        expect(page).to have_content("Breckenridge")
        expect(page).to have_content("Frisco")
        expect(page).to_not have_content("NYC")
      end
    end
  end
end