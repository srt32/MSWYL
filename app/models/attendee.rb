class Attendee < ActiveRecord::Base
  attr_accessible :email, :event_id, :name, :num_guests, :semester

  belongs_to :event
end
