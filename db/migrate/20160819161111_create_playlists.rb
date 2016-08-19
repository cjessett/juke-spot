class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.integer :party_id, null: false

      t.timestamps(null: false)
    end
  end
end
