class AddPosters < ActiveRecord::Migration
  def self.up
    add_attachment :movies, :poster
  end

  def self.down
    remove_attachment :movies, :poster
  end
end
