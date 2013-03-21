class AddDescriptionColumnToEvents < ActiveRecord::Migration
  def change
    add_column :events, :description, :text
    add_column :events, :host_name, :string
    add_column :events, :host_contact, :string
    add_column :events, :event_date, :date 
    add_column :events, :event_time, :time 
    add_column :events, :instructions, :text
  end
end
