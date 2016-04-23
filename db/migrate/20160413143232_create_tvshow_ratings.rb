class CreateTvshowRatings < ActiveRecord::Migration
  def change
    create_table :tvshow_ratings do |t|
      t.references :tvshows, index: true
      t.references :users, index: true
      t.string :username
      t.float :rating
      t.timestamps null: false
    end
  end
end
