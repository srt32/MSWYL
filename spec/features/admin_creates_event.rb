require 'spec_helper'

describe 'admin creates an event', :type => :feature do
  before do
    User.create!(:email => "simon@example.com", :password => "foobar", 
                  :password_confirmation => "foobar",
                   :admin => true)
    visit "/"
  end

  describe 'admin sign in' do
    it "should display the sign in form" do
      click_link 'Admin'
      page.should have_content('Sign in')
    end

    it "should redirect to homepage after sign in" do
      click_link 'Admin'
      fill_in 'Email', with: "simon@example.com"
      fill_in 'Password', with: "foobar"
      click_on "Sign in"
      page.should have_content("Signed in successfully.")
    end
  end  

  describe 'admin creates a new event' do
  	it "should display new event form" do
	    click_link 'Admin'
      fill_in 'Email', with: "simon@example.com"
      fill_in 'Password', with: "foobar"
      click_on "Sign in"

      click_link 'New Event'
      page.should have_content('New event')
		end

    it "should create a new event" do
      click_link 'Admin'
      fill_in 'Email', with: "simon@example.com"
      fill_in 'Password', with: "foobar"
      click_on "Sign in"
      click_link 'New Event'

      fill_in 'event_event_name', with: "rotten"
      fill_in 'event_street', with: "NYC"
      fill_in 'event_description', with: "tomatoes"

      click_on 'Create Event'
      page.should have_content('Event was successfully created.')
    end
  end
end
