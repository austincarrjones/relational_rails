require 'rails_helper'

RSpec.describe 'towns new page' do
  context 'as a user' do
    describe 'when I visit towns show' do
    # [ ] done
    # User Story 12, Parent Update 
    # As a visitor
    # When I visit a parent show page
    # Then I see a link to update the parent "Update Parent"
    # When I click the link "Update Parent"
    # Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
    # When I fill out the form with updated information
    # And I click the button to submit the form
    # Then a `PATCH` request is sent to '/parents/:id',
    # the parent's info is updated,
    # and I am redirected to the Parent's Show page where I see the parent's updated info

      it 'I see a link to update the town' do
        breck = Town.create!(name: "Breckenridge", year_round_riding: false, population: 5078)
        
        visit "/towns/#{breck.id}"
        click_link("Update Town")

        expect(current_path).to eq("/towns/#{breck.id}/edit")
      end

      it 'can update the town' do
        breck = Town.create!(name: "Breckenfridge", year_round_riding: false, population: 5078)
        visit "/towns/#{breck.id}/edit"

        fill_in "name", with: "Breckenridge"
        fill_in "population", with: 7
        # choose "Yes"
        click_button "Update Town"

        expect(current_path).to eq("/towns/#{breck.id}")
        expect(page).to have_content("Breckenridge")
        expect(page).to have_content(7)
        # expect(page).to have_content(true)
      end
    end
  end
end