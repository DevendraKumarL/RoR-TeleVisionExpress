class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :season_name
      t.references :tvshows, index: true
      t.integer :year
      t.text :season_overview
      t.integer :rating
      t.string :image
      t.text :language
      t.integer :no_episodes
      t.timestamps null: false
    end
  end
end
