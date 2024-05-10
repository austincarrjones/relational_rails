require 'rails_helper'

# [X] done
# User Story 4, Child Show 
# As a visitor
# When I visit '/child_table_name/:id'
# Then I see the child with that id including the child's attributes
# (data from each column that is on the child table)

RSpec.describe 'trails show page' do
  context 'as a user' do
    describe 'when I visit trails/:id' do 
      it 'I can see that trail and attributes' do
        breck = Town.create!(name: "Breckenridge")
        sidedoor = breck.trails.create!(name: "Side Door", difficulty: "Intermediate/Difficult", distance: 2, downhill_only: true)
        bettys = breck.trails.create!(name: "Bettys's", difficulty: "Intermediate", distance: 1, downhill_only: false)
        
        visit "/trails/#{sidedoor.id}"
        save_and_open_page
        expect(page).to have_content(sidedoor.name)
        expect(page).to have_content(sidedoor.distance)
        expect(page).to have_content(sidedoor.difficulty)
        expect(page).to have_content(sidedoor.downhill_only)
        expect(page).to_not have_content(bettys.name)
      end
    end
  end
end
