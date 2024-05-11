require 'rails_helper'

# [X] done
# User Story 5, Parent Children Index 
# As a visitor
# When I visit '/towns/:town_id/trails_table_name'
# Then I see each trail that is associated with that town with each trail's attributes
# (data from each column that is on the child table)

RSpec.describe 'Towns trails index' do
  context 'as a user' do
    describe 'when I visit towns trails index' do
      it 'I can see each trail (and attributes) associated with that town' do
        breck = Town.create!(name: "Breckenridge")
        sidedoor = breck.trails.create!(name: "Side Door", difficulty: "Intermediate/Difficult", distance: 2, downhill_only: true)
        bettys = breck.trails.create!(name: "Bettys's", difficulty: "Intermediate", distance: 1, downhill_only: false)
        
        sedona = Town.create!(name: "Sedona")
        ridge = sedona.trails.create!(name: "Ridge", difficulty: "Difficult", distance: 3, downhill_only: true)


        visit "/towns/#{breck.id}/trails"
         save_and_open_page
        expect(page).to have_content(sidedoor.name)
        expect(page).to have_content(bettys.name)
        expect(page).to_not have_content(ridge.name)
      end
    end
  end
end
