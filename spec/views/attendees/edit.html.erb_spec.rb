require 'spec_helper'

describe "attendees/edit" do
  before(:each) do
    @attendee = assign(:attendee, stub_model(Attendee,
      :event_id => 1,
      :email => "MyString",
      :name => "MyString",
      :semester => "MyString",
      :num_guests => 1
    ))
  end

  it "renders the edit attendee form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => attendees_path(@attendee), :method => "post" do
      assert_select "input#attendee_event_id", :name => "attendee[event_id]"
      assert_select "input#attendee_email", :name => "attendee[email]"
      assert_select "input#attendee_name", :name => "attendee[name]"
      assert_select "input#attendee_semester", :name => "attendee[semester]"
      assert_select "input#attendee_num_guests", :name => "attendee[num_guests]"
    end
  end
end
