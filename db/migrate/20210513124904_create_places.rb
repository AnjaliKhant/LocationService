class CreatePlaces < ActiveRecord::Migration[6.1]
  def change
    create_table :places do |t|
      t.float   :latitude, limit: 50
      t.float   :longitude, limit: 50
      t.string  :name
      t.string  :zip_code, limit: 10
      t.string  :address
      t.string  :country
      t.timestamps
    end
    add_index :places, :latitude
    add_index :places, :longitude
  end
end
