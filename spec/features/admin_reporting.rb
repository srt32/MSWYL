require 'spec_helper'

describe 'admin reporting', :type => :feature do
  before do
    User.create!(:email => "simon@example.com", :password => "foobar", 
                  :password_confirmation => "foobar",
                   :admin => true)
    visit "/"
    click_link 'Admin'
    fill_in 'Email', with: "simon@example.com"
    fill_in 'Password', with: "foobar"
    click_on "Sign in"
  end

  describe 'summary pages' do
    it "should have total rsvp content" do
      visit "/"
      page.should have_content("Total RSVP's")
    end

    it "should have summary of attendees" do
      visit '/events/summary'
      page.should have_content('Summary of attendees')
    end
  end 
end
