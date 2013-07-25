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
  end

  describe "should go to event#show page when user clicks on event" do
    it "should show event name on event#show" do
      click_link 'See more details'
      page.should have_content("Event Name: Eat mushrooms")
    end
    it "should have sign me up button" do
      click_link 'See more details'
      page.should have_button("Sign Me Up!")
    end
  end

  describe "attendee sign up" do
    it "the page should display email and full name" do
      click_link 'See more details'
      click_button 'Sign Me Up!'
      page.should have_content("Email Full name")   
    end
    it "the page should display RSVP Now button" do
      click_link 'See more details'
      click_button 'Sign Me Up!'
      page.should have_button("RSVP Now")   
    end

    describe "should show confirmation message after submitting the form" do
      pending "should go to success message when form submitted" do
        click_link 'See more details'
        click_button 'Sign Me Up!'
        fill_in 'Email', with: "simon@example.com"
        fill_in 'attendee_name', with: "Simon T"
        fill_in 'attendee_phone', with: "1234567890"
        fill_in 'attendee_num_guests', with: "1"
        click_on 'RSVP Now'
        page.should have_content("Awesome! You're signed up.")
      end
    end
  end
end
