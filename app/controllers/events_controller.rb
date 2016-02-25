class EventsController < ApplicationController
  def index
    @events = MatchingEvents.call(filter_params.to_h)
  end

  def create
    @event = User.first.events.new(event_params)
    if @event.save
      head :no_content
    else
      render json: @event.errors
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :longitude, :latitude, :description, 
                                  :price, :been_there, :time, :category, :time)
  end

  def filter_params
    params.require(:filters).permit(:longitude, :latitude, :distance, :price, :category,
                                   :starts_after, :starts_before, :min_age, :max_age, :sex)
      .to_h.symbolize_keys
  end
end
