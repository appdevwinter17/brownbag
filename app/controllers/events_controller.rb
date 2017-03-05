class EventsController < ApplicationController
  before_action :current_user_must_be_event_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_event_user
    event = Event.find(params[:id])

    unless current_user == event.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @events = Event.page(params[:page]).per(10)

    render("events/index.html.erb")
  end

  def show
    @invitation = Invitation.new
    @comment = Comment.new
    @event = Event.find(params[:id])

    render("events/show.html.erb")
  end

  def new
    @event = Event.new

    render("events/new.html.erb")
  end

  def create
    @event = Event.new

    @event.user_id = params[:user_id]
    @event.restaurant_id = params[:restaurant_id]
    @event.host = params[:host]
    @event.title = params[:title]
    @event.description = params[:description]
    @event.time = params[:time]
    @event.date = params[:date]
    @event.available = params[:available]
    @event.capacity_limit = params[:capacity_limit]

    save_status = @event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/events/new", "/create_event"
        redirect_to("/events")
      else
        redirect_back(:fallback_location => "/", :notice => "Event created successfully.")
      end
    else
      render("events/new.html.erb")
    end
  end

  def edit
    @event = Event.find(params[:id])

    render("events/edit.html.erb")
  end

  def update
    @event = Event.find(params[:id])
    @event.restaurant_id = params[:restaurant_id]
    @event.host = params[:host]
    @event.title = params[:title]
    @event.description = params[:description]
    @event.time = params[:time]
    @event.date = params[:date]
    @event.available = params[:available]
    @event.capacity_limit = params[:capacity_limit]

    save_status = @event.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/events/#{@event.id}/edit", "/update_event"
        redirect_to("/events/#{@event.id}", :notice => "Event updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Event updated successfully.")
      end
    else
      render("events/edit.html.erb")
    end
  end

  def destroy
    @event = Event.find(params[:id])

    @event.destroy

    if URI(request.referer).path == "/events/#{@event.id}"
      redirect_to("/", :notice => "Event deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Event deleted.")
    end
  end
end
