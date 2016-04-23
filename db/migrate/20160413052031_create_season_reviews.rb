class CreateSeasonReviews < ActiveRecord::Migration
  def change
    create_table :season_reviews do |t|
      t.references :seasons, index: true
      t.references :users, index: true
      t.string :username
      t.text :review
      t.timestamps null: false
    end
  end
end
