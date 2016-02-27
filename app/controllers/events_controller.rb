class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def create
  end

  def show
  end
end
