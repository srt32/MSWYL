# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  street     :text
#  city       :string(255)
#  state      :string(255)
#  zip        :integer
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Event < ActiveRecord::Base
  attr_accessible :city, :latitude, :longitude, :state, :street, :zip

  geocoded_by :address   # can also be an IP address
  # after_validation :geocode
  after_validation :geocode, :if => :street_changed?

  def address
  	[street].compact.join(', ')
  end

end
