module ControllerEvent
  def self.included(controller)
    controller.send :helper_method, :current_event
  end

  def current_event
  	@current_event = Event.find_by_id(params[:event_id])
  end

end