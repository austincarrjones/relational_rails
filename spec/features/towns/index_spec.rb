require 'rails_helper'

# [X] done
# User Story 1, Parent Index 
# For each parent table
# As a visitor
# When I visit '/parents'
# Then I see the name of each parent record in the system

# [ ] done
# User Story 6, Parent Index sorted by Most Recently Created 
# As a visitor
# When I visit the parent index,
# I see that records are ordered by most recently created first
# And next to each of the records I see when it was created

# [ ] done
# User Story 8, Child Index Link
# As a visitor
# When I visit any page on the site
# Then I see a link at the top of the page that takes me to the Child Index

RSpec.describe 'towns index page' do
  context 'as a user' do
    describe 'when I visit towns index' do
      it 'I can see the name of each town record' do
        Town.create!(name: "Breckenridge")
        Town.create!(name: "Frisco")

        visit '/towns'
        expect(page).to have_content("Breckenridge")
        expect(page).to have_content("Frisco")
      end

      it 'I see records with created timestamp' do
        Town.create!(name: "Breckenridge")
        Town.create!(name: "Frisco")
        
        visit '/towns'
        expect(page).to have_content("Name: Breckenridge - created at:")
        expect(page).to have_content("Name: Frisco - created at:")
      end
      
      it 'I see them ordered by most recently created first' do
        breck = Town.create!(name: "Breckenridge")
        frisco = Town.create!(name: "Frisco", created_at: Time.now - 1.day)
        sedona = Town.create!(name: "Sedona", created_at: Time.now - 2.day)
        
        visit '/towns'
        expect(sedona.name).to appear_before(frisco.name)
        expect(sedona.name).to appear_before(breck.name)
        expect(frisco.name).to appear_before(breck.name)
      end

      it 'I see a link at the top of the page that takes me to the Trails Index' do
        visit '/towns'
        # save_and_open_page
        
        expect(page).to have_link("All Trails"), href: '/trails'
      end
    end
  end
end