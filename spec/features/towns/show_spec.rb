require 'rails_helper'

# [X] done
# User Story 2, Parent Show 
# As a visitor
# When I visit '/parents/:id'
# Then I see the parent with that id including the parent's attributes
# (data from each column that is on the parent table)

# [X] done
# User Story 7, Parent Child Count
# As a visitor
# When I visit a parent's show page
# I see a count of the number of children associated with this parent

RSpec.describe 'towns show page' do
  context 'as a user' do
    describe 'when I visit towns/:id' do
      it 'I can see the town with that id including the attributes' do
        breck = Town.create!(name: "Breckenridge", year_round_riding: false, population: 5078)
        sedona = Town.create!(name: "Sedona", year_round_riding: true, population: 10031)
        
        visit "/towns/#{breck.id}"
        expect(page).to have_content(breck.name)
        expect(page).to have_content(breck.year_round_riding)
        expect(page).to have_content(breck.population)
        expect(page).to_not have_content(sedona.name)
      end

      it 'I can see a count of the number of trails associated with this town' do
        breck = Town.create!(name: "Breckenridge", year_round_riding: false, population: 5078)
        sedona = Town.create!(name: "Sedona", year_round_riding: true, population: 10031)
        sidedoor = breck.trails.create!(name: "Side Door", difficulty: "Intermediate/Difficult", distance: 2, downhill_only: true)
        bettys = breck.trails.create!(name: "Bettys's", difficulty: "Intermediate", distance: 1, downhill_only: false)
        
        visit "/towns/#{breck.id}"
        save_and_open_page
        expect(page).to have_content("Number of trails: 2")
      end
    end
  end
end