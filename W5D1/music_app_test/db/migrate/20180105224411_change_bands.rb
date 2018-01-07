class ChangeBands < ActiveRecord::Migration[5.1]
  def change
    change_column :albums, :is_live_album, :boolean, default: false
  end
end
