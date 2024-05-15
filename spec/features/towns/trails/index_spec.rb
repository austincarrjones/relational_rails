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
        #save_and_open_page
        expect(page).to have_content(sidedoor.name)
        expect(page).to have_content(bettys.name)
        expect(page).to_not have_content(ridge.name)
      end

      # [ ] done
      # User Story 13, Parent Child Creation 
      # As a visitor
      # When I visit a Parent Children Index page
      # Then I see a link to add a new adoptable child for that parent "Create Child"
      # When I click the link
      # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
      # When I fill in the form with the child's attributes:
      # And I click the button "Create Child"
      # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
      # a new child object/row is created for that parent,
      # and I am redirected to the Parent Childs Index page where I can see the new child listed
      it 'has a link to add a new trail for that town' do
        breck = Town.create!(name: "Breckenridge")

        visit "/towns/#{breck.id}/trails"
        click_link("Create Trail")
        expect(current_path).to eq("/towns/#{breck.id}/trails/new")
      end

      it 'can create trail' do
        breck = Town.create!(name: "Breckenridge")
        
        visit "/towns/#{breck.id}/trails/new"
        fill_in("name", with: "Barney Flow")
        click_button("Create Trail")
        expect(current_path).to eq("/towns/#{breck.id}/trails")
        expect(page).to have_content("Barney Flow")
      end
    end
  end
end
