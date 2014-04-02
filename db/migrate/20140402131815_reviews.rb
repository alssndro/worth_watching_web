class Reviews < ActiveRecord::Migration
  def change
      create_table :reviews do |t|
      t.integer :movie_id
      t.string :author
      t.date :date
      t.string :rating
      t.string :original_score
      t.string :source
      t.text :quote
      t.string :link

      t.timestamps
    end
  end
end
