class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|

      t.references :spot, foreign_key: true
      t.string :image

      t.timestamps
    end
  end
end
