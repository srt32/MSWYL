require 'spec_helper'

describe 'Visitor signs up for event', :type => :feature do
    before do
      Event.create!(:event_name => "Eat mushrooms", :description => "delicious")
      visit "/"
    end

  describe 'visitor signing up for event' do
  	it "should display 'Eat mushrooms'" do
	    page.should have_content("Eat mushrooms")
		end

    it "should go to event#show page when user clicks on event" do
      click_link 'See more details'
      page.should have_content("Event Name: Eat mushrooms")
    end

    it "can sign up for an event" do
      pending "user can sign up"
      # click SIGN ME UP
      # fill out form
      # submit form
      # should go to some page...
      # this visitor should be included in the guest list
    end
  end
end
