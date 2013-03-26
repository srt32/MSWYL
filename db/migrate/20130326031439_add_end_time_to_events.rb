class AddEndTimeToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :end_time, :time
  end

  def self.down
  	remove_colimn :events, :end_time
  end
end
