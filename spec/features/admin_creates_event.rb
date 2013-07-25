require 'spec_helper'

describe 'admin creates an event', :type => :feature do
  before do
    User.create!(:email => "simon@example.com", :password => "foobar", 
                  :password_confirmation => "foobar",
                   :admin => :true)
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
  	pending it "should display 'SOMETHING'" do
	   page.should have_content("SOMETHING")
		end

    pending it "click on NEW EVENT" do
      click_link 'NEW EVENT'
      page.should have_content("EVENT FORM")
    end
  end

  describe "submitting event form" do
   pending ""
    # fill out the form
    # submit the form
    # page should have success
  
    # homepage should have the new event listed
  end
end
