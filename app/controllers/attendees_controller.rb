class AttendeesController < ApplicationController
  # GET /attendees
  # GET /attendees.json
  def index
    @event = current_event
    @attendees = @event.attendees.all
    authorize! :manage, @attendees

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @attendees }
    end
  end

  # GET /attendees/1
  # GET /attendees/1.json
  def show
    @attendee = Attendee.find(params[:id])
    authorize! :manage, @attendee

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @attendee }
    end
  end

  # GET /attendees/new
  # GET /attendees/new.json
  def new
    @event = current_event
    @attendee = Attendee.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @attendee }
    end
  end

  # GET /attendees/1/edit
  def edit
    @attendee = Attendee.find(params[:id])
    authorize! :manage, @attendee
  end

  # POST /attendees
  # POST /attendees.json
  def create
    @event = current_event
    @attendee = @event.attendees.new(params[:attendee])

    respond_to do |format|
      if @attendee.save
        format.html { redirect_to @event, notice: 
              "Awesome!  You're signed up.  Expect to receive an email from 
                the event organizer in the next couple days. " }
        format.json { render json: @event, status: :created, location: @attendee }
      else
        format.html { render action: "new" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /attendees/1
  # PUT /attendees/1.json
  def update
    @event = current_event
    @attendee = Attendee.find(params[:id])
    authorize! :manage, @attendee

    respond_to do |format|
      if @attendee.update_attributes(params[:attendee])
        format.html { redirect_to root_path, notice: 'Attendee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @attendee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /attendees/1
  # DELETE /attendees/1.json
  def destroy
    @attendee = Attendee.find(params[:id])
    @attendee.destroy
    authorize! :manage, @attendee

    respond_to do |format|
      format.html { redirect_to attendees_url }
      format.json { head :no_content }
    end
  end
end
