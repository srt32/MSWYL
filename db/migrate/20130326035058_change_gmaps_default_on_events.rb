class ChangeGmapsDefaultOnEvents < ActiveRecord::Migration
  def self.up
  	change_column :events, :gmaps, :boolean, :default => true
  end

  def self.down
  	change_column :events, :gmaps, :boolean, :default => false
  end
end
