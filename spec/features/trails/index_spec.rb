require 'rails_helper'

# [X] done
# User Story 3, Child Index 
# As a visitor
# When I visit '/child_table_name'
# Then I see each Child in the system including the Child's attributes
# (data from each column that is on the child table)

RSpec.describe 'US3 trails index page' do
  context 'as a user' do
    describe 'when I visit trails index' do
      it 'I can see the name of each trail record' do
        breck = Town.create!(name: "Breckenridge")
        sidedoor = breck.trails.create!(name: "Side Door", difficulty: "Intermediate/Difficult", distance: 2, downhill_only: true)
        bettys = breck.trails.create!(name: "Bettys's", difficulty: "Intermediate", distance: 1, downhill_only: false)

        visit '/trails'
        #save_and_open_page
        expect(page).to have_content("Side Door")
        expect(page).to have_content("Bettys's")
      end
    end
  end
end