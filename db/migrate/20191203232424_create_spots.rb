class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :res_id
      t.string :city
      t.string :suburb
      t.string :thumbnail

      t.timestamps
    end
  end
end
