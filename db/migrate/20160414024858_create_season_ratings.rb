class CreateSeasonRatings < ActiveRecord::Migration
  def change
    create_table :season_ratings do |t|
      t.references :seasons, index: true
      t.references :users, index: true
      t.string :username
      t.float :rating
      t.timestamps null: false
    end
  end
end
