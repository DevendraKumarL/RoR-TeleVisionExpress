class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.string :episode_name
      t.references :seasons, index: true
      t.text :episode_description
      t.date :air_date
      t.integer :rating
      t.string :image
      t.timestamps null: false
    end
  end
end
