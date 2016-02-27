class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :event, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :stars
      t.string :comment

      t.timestamps null: false
    end
  end
end
