class MatchesController < ApplicationController

  before_action :set_event

  def index
    @matches = @event.matches.where(status: Match.statuses[:unanswered])
  end

  def create
    @match = MatchService.new(@event).create_match_for(current_user)
    head :created, location: event_match_path(@event, @match)
  end

  def update
    method = ["accept", "decline"].include?(params[:match]) ? params[:match] : "decline"
    @match = @event.matches.find(params[:id])
    MatchService.new(@event).send(method, @match)
    head :no_content
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end
end
