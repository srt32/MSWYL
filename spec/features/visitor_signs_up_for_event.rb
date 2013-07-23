require 'spec_helper'

feature 'Visitor signs up for event' do
	scenario 'select an event' do
    open_event

    expect(page).to have_content('Event Name')
	end

	def open_event
    visit root_path
    click_button 'See more details'
	end
end