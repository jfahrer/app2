class MatchService
  def initialize(event)
    @event = event
  end

  def create_match_for(user)
    Match.create(user: user, event: @event)
  end

  def accept(match)
    match.accepted!
    @event.accepted!
  end

  def decline(match)
    match.declined!
  end
end
