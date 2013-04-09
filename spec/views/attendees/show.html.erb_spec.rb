require 'spec_helper'

describe "attendees/show" do
  before(:each) do
    @attendee = assign(:attendee, stub_model(Attendee,
      :event_id => 1,
      :email => "Email",
      :name => "Name",
      :semester => "Semester",
      :num_guests => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Email/)
    rendered.should match(/Name/)
    rendered.should match(/Semester/)
    rendered.should match(/2/)
  end
end
