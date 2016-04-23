class CreateEpisodeReviews < ActiveRecord::Migration
  def change
    create_table :episode_reviews do |t|
      t.references :episodes, index: true
      t.references :users, index: true
      t.string :username
      t.text :review
      t.timestamps null: false
    end
  end
end
