class CreateSong < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
        t.string :title
        t.integer :artist_id
        t.integer :genre_id
        t.float :length
    end
  end
end