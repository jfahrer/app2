class AddAgeAsIntegerToUsers < ActiveRecord::Migration
  def change
    remove_column :users, :age, :string
    add_column :users, :age, :integer
  end
end
