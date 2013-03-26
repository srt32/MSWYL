class AddEventNameToEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :event_name, :string
  end

  def self.down
  	remove_column :events, :event_name
  end
end