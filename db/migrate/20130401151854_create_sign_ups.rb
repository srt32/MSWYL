class CreateSignUps < ActiveRecord::Migration
 def self.up
    create_table :signups, :id => false do |t|
      t.integer :user_id
      t.integer :event_id
    end
  end

  def self.down
  	drop_table :signups
  end
end
