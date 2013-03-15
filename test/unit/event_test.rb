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

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
