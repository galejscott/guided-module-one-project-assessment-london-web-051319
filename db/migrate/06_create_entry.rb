class CreateEntry < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :playlist_id
      t.integer :song_id
    end
  end
end