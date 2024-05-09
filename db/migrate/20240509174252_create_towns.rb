class CreateTowns < ActiveRecord::Migration[7.1]
  def change
    create_table :towns do |t|
      t.string :name
      t.boolean :year_round_riding
      t.integer :population

      t.timestamps
    end
  end
end
