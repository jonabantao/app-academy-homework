class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.string :title, null: false
      t.integer :ord, null: false
      t.boolean :regular, null: false, default: true
      t.text :lyrics
      t.integer :album_id, null: false

      t.timestamps
    end

    add_index :tracks, :album_id, unique: true
    add_index :tracks, :ord, unique: true
  end
end
