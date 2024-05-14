require 'rails_helper'

RSpec.describe 'towns new page' do
  context 'as a user' do
    describe 'when I visit towns index' do
      # [ ] done
      # User Story 11, Parent Creation 
      # As a visitor
      # When I visit the Parent Index page
      # Then I see a link to create a new Parent record, "New Parent"
      # When I click this link
      # Then I am taken to '/parents/new' where I  see a form for a new parent record
      # When I fill out the form with a new parent's attributes:
      # And I click the button "Create Parent" to submit the form
      # Then a `POST` request is sent to the '/parents' route,
      # a new parent record is created,
      # and I am redirected to the Parent Index page where I see the new Parent displayed.
      it 'I see a link to create a new Town record' do
        visit '/towns'
        click_link("New Town")
        expect(current_path).to eq('/towns/new')
      end

      it 'On /towns/new I see a form for a new town record' do
        visit '/towns/new'
        
        # save_and_open_page
        fill_in("name", with: "Frisco")
        fill_in("population", with: 5000)
        click_button("Create Town")
        new_town_id = Town.last.id
        expect(current_path).to eq("/towns")
        expect(page).to have_content("Frisco")
        expect(page).to have_content("5000")
      end

    end
  end
end