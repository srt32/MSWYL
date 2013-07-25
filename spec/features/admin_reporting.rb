require 'spec_helper'

describe 'admin creates an event', :type => :feature do
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

  describe 'TEST' do
    it "test" do
      pending
    end
  end  
end
