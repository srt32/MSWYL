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
#  gmaps        :boolean          default(TRUE)
#  event_name   :string(255)
#  end_time     :time
#

class Event < ActiveRecord::Base
  has_many :attendees

  has_many :signups
  has_many :users, :through => :signups

  geocoded_by :address
  after_validation :geocode, :if => :street_changed?

  acts_as_gmappable

  def gmaps4rails_infowindow
    "#{self.event_name}"
  end

  def gmaps4rails_address
  	"#{self.address}"
  end

  def address
  	[street].compact.join(', ')
  end

end
