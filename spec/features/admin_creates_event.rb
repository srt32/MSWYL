require 'spec_helper'

describe 'admin creates an event', :type => :feature do
  before do
    visit "/"
  end

  describe 'admin signs in' do
    # create new admin user
    # sign in the admin here
  end  

  describe 'go to home page and click new event' do
  	it "should display 'SOMETHING'" do
	    page.should have_content("SOMETHING")
		end

    it "click on NEW EVENT" do
      click_link 'NEW EVENT'
      page.should have_content("EVENT FORM")
    end
  end

  describe "submitting event form" do
    # fill out the form
    # submit the form
    # page should have success
  
    # homepage should have the new event listed
  end
end
