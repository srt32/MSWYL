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

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
