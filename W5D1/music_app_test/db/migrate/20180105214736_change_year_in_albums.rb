class ChangeYearInAlbums < ActiveRecord::Migration[5.1]
  def change
    change_column :albums, :year, :integer, null: false
  end
end
