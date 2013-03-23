# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  street       :text
#  city         :string(255)
#  state        :string(255)
#  zip          :integer
#  latitude     :float
#  longitude    :float
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  description  :text
#  host_name    :string(255)
#  host_contact :string(255)
#  event_date   :date
#  event_time   :time
#  instructions :text
#  gmaps        :boolean          default(FALSE)
#

class Event < ActiveRecord::Base
  attr_accessible :city, :state, :street, :zip, :description,
  					:host_name, :host_contact, :event_date, :event_time, :instructions

  geocoded_by :address
  after_validation :geocode, :if => :street_changed?

  acts_as_gmappable

  def gmaps4rails_address
  	"#{self.address}"
  end

  def address
  	[street].compact.join(', ')
  end

end
