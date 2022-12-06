# frozen_string_literal: true

##
# Controller for events' CRUD and show operations
class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: %i[show edit update destroy]

  ##
  # GET /events or /events.json
  #
  # Action returns list of events depending on user
  def index
    @events = policy_scope(Event).includes(:items).page(params[:page]).per(Settings.pager.per_page)
  end

  ##
  # GET /events/1 or /events/1.json
  #
  # Action returns detailed info about event
  def show
    authorize @event
  end

  ##
  # GET /events/new
  #
  # Action returns form for creating event.
  def new
    @event = Event.new
  end

  ##
  # GET /events/1/edit
  #
  # Action returns form for editing event.
  def edit
    authorize @event
  end

  ##
  # POST /events or /events.json
  #
  # Action creates event and redirects to it
  def create
    @event = current_user.events.create(event_params)

    respond_to do |format|
      if @event
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # PATCH/PUT /events/1 or /events/1.json
  #
  # Action saves updated event and redirects to it
  def update
    authorize @event
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to event_url(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  ##
  # DELETE /events/1 or /events/1.json
  #
  # Action destroys event and redirects to events' list
  def destroy
    authorize @event
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  ##
  # Method searches event in database by id and returns it
  def set_event
    @event = Event.find(params[:id])
  end

  ##
  # Method returns hash with allowed event's parameters sent by user
  def event_params
    params.require(:event).permit(:name, :content, :finished_at, :done)
  end
end
