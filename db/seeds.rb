# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

breck = Town.create!(name: "Breckenridge", year_round_riding: false, population: 5078)
frisco = Town.create!(name: "Frisco", year_round_riding: false, population: 2913, created_at: Time.now - 1.day)
sedona = Town.create!(name: "Sedona", year_round_riding: true, population: 10031, created_at: Time.now - 2.day)

sidedoor = breck.trails.create!(name: "Side Door", difficulty: "Intermediate/Difficult", distance: 2, downhill_only: true)
bettys = breck.trails.create!(name: "Bettys's", difficulty: "Intermediate", distance: 1, downhill_only: false)