class Attendee < ActiveRecord::Base
  attr_accessible :email, :event_id, :name, :num_guests, :semester

  belongs_to :event

  validates_numericality_of :num_guests, :only_integer => true, 
  								:message => "can only be whole number."
  validates_inclusion_of :num_guests, :in => 0..30, 
  								:message => "can only be between 0 and 30."
end
