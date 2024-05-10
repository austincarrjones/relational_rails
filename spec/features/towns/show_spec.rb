require 'rails_helper'

# [X] done
# User Story 2, Parent Show 
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

RSpec.describe 'towns show page' do
  context 'as a user' do
    describe 'when I visit towns/:id' do
      it 'I can see the town with that id including the attributes' do
        breck = Town.create!(name: "Breckenridge", year_round_riding: false, population: 5078)
        sedona = Town.create!(name: "Sedona", year_round_riding: true, population: 10031)

        visit "/towns/#{breck.id}"
        # save_and_open_page
        expect(page).to have_content(breck.name)
        expect(page).to have_content(breck.year_round_riding)
        expect(page).to have_content(breck.population)
        expect(page).to_not have_content(sedona.name)
        
        # visit "/towns/#{sedona.id}"
        # save_and_open_page
      end
    end
  end
end