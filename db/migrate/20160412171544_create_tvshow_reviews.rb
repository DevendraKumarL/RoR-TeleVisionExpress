class CreateTvshowReviews < ActiveRecord::Migration
  def change
    create_table :tvshow_reviews do |t|
      t.references :tvshows, index: true
      t.references :users, index: true
      t.text :review
      t.timestamps null: false
    end
  end
end
