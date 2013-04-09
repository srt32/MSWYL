module ControllerEvent
  def self.included(controller)
    controller.send :helper_method, :current_event, :total_rsvps
  end

  def current_event
  	@current_event = Event.find_by_id(params[:event_id])
  end

  def total_rsvps
  	Attendee.all.count + Attendee.sum("num_guests")
  end
end