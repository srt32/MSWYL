class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  include ControllerEvent
  def index
    if params[:search].present?
      @events = Event.near(params[:search], 50)
      if @events.empty?
        @events_map_data = Event.all.to_gmaps4rails
        flash.now[:notice] = "Sorry! There is currently no event near that location. 
                              Take a look at the map above for some other events, 
                              or use your browser's back button to return to the home page."
      else
        @events
        @events_map_data = @events.to_gmaps4rails
      end
    else
      @events = Event.all
      @events_map_data = @events.to_gmaps4rails
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  def summary
    @events = Event.all
    authorize! :update, @event
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new
    authorize! :new, @event

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    authorize! :update, @event
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])
    authorize! :update, @event

    respond_to do |format|
      if @event.update_attributes(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    authorize! :destroy, @event
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

private
  def event_params
    params.require(:event).permit(:city, :state, :street, :zip, :description,
            :host_name, :host_contact, :event_date, :event_time,
            :instructions, :event_name, :end_time)
  end

end
