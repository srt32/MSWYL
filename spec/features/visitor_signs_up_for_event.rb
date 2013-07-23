require 'spec_helper'

describe 'Visitor signs up for event', :type => :feature do
    before do
      Event.create!(:event_name => "Eat mushrooms", :description => "delicious")
      visit "/"
    end

  describe 'get /' do
  	it "should display 'Eat mushrooms'" do
	    page.should have_content("Eat mushrooms")
		end

    it "should go to event#show page when user clicks on event" do
      click_link 'See more details'
      page.should have_content("Event Name: Eat mushrooms")
    end
  end
end
