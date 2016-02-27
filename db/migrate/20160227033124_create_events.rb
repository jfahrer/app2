class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.string :location
      t.float :latitude
      t.float :longitude
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
