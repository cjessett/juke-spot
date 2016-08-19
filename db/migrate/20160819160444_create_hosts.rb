class CreateHosts < ActiveRecord::Migration
  def change
    create_table :hosts do |t|
      t.string :spotify_id, index: true

      t.timestamps null: false
    end
  end
end
