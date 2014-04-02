class Movies < ActiveRecord::Migration
  def change
      create_table :movies do |t|
      t.string :title
      t.text :plot
      t.float :rt_rating
      t.string :rt_url
      t.float :imdb_rating
      t.string :imdb_url
      t.float :metacritic_rating
      t.string :metacritic_url
      t.string :cast
      t.date :release_date
      t.string :director
      t.string :genre
      t.string :release_type

      t.timestamps
    end
  end
end
