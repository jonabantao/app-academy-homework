class CreateToys < ActiveRecord::Migration[5.1]
  def change
    create_table :toys do |t|

      t.timestamps
    end
  end
end
