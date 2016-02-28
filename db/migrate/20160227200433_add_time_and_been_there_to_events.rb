class AddTimeAndBeenThereToEvents < ActiveRecord::Migration
  def change
    add_column :events, :time, :timestamp
    add_column :events, :been_there, :boolean
  end
end
