class CreateTrails < ActiveRecord::Migration[7.1]
  def change
    create_table :trails do |t|
      t.string :name
      t.string :difficulty
      t.integer :distance
      t.boolean :downhill_only
      t.references :town, null: false, foreign_key: true

      t.timestamps
    end
  end
end
