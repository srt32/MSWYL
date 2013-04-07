require 'spec_helper'

describe "attendees/index" do
  before(:each) do
    assign(:attendees, [
      stub_model(Attendee,
        :event_id => 1,
        :email => "Email",
        :name => "Name",
        :semester => "Semester",
        :num_guests => 2
      ),
      stub_model(Attendee,
        :event_id => 1,
        :email => "Email",
        :name => "Name",
        :semester => "Semester",
        :num_guests => 2
      )
    ])
  end

  it "renders a list of attendees" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Semester".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
