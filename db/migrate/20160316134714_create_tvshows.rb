class CreateTvshows < ActiveRecord::Migration
  def change
    create_table :tvshows do |t|
      t.string :name
      t.references :categories, index: true
      t.integer :year
      t.string :director
      t.string :language
      t.text :storyline
      t.text :cast
      t.float :rating
      t.date :aired_on
      t.integer :no_seasons
      t.string :image
      t.timestamps null: false
    end
  end
end
