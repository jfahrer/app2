class MatchesController < ApplicationController

  before_action :set_event

  def show
    @match = @event.matches.find(params[:id])
  end

  def index
    @matches = @event.matches.where(status: Match.statuses[:unanswered])
  end

  def create
    @match = MatchService.new(@event).create_match_for(current_user)
    render :show
  end

  def update
    method = ["accept", "decline"].include?(params[:match]) ? params[:match] : "decline"
    @match = @event.matches.find(params[:id])
    MatchService.new(@event).send(method, @match)
    render :show
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
