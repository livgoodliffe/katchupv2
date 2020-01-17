class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.boolean :recommend
      t.string :image
      t.text :notes

      t.timestamps
    end
  end
end
