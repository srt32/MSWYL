module ControllerEvent
  def self.included(controller)
    controller.send :helper_method, :current_event, :total_rsvps,
    					:last_rsvp_date, :total_rsvps_event
  end

  def current_event
  	@current_event = Event.find_by_id(params[:event_id])
  end

  def total_rsvps
  	Attendee.all.count + Attendee.sum("num_guests")
  end

  def total_rsvps_event(event)
    event.attendees.count + Attendee.where(:event_id => event.id).sum("num_guests")
  end

  def last_rsvp_date(event)
  	if Attendee.where(:event_id => event.id).empty?
      "No RSVP's"
    else
      Attendee.where(:event_id => event.id).order("created_at DESC").first.created_at.strftime("%B %d") rescue nil
    end
  end
end