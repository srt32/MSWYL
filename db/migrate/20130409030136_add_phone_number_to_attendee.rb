class AddPhoneNumberToAttendee < ActiveRecord::Migration
  def self.up
    add_column :attendees, :phone, :string
  end

  def self.down
  	remove_column :attendees, :phone
  end
end
