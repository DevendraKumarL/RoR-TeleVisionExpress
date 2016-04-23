class CreateEpisodeRatings < ActiveRecord::Migration
  def change
    create_table :episode_ratings do |t|
      t.references :episodes, index: true
      t.references :users, index: true
      t.string :username
      t.float :rating
      t.timestamps null: false
    end
  end
end
