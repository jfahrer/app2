RSpec.describe MatchService do
  it 'creates a new possible match for a given user' do
    event = FactoryGirl.create(:event)
    user = FactoryGirl.create(:user)
    expect{ MatchService.new(event).create_match_for(user) }.to change{ Match.count }.by(1)
    match = Match.last
    expect(match.user).to eq(user)
    expect(match.event).to eq(event)
  end

  it 'should update the status of the event on accepting a new match' do
    event = FactoryGirl.create(:event)
    match = FactoryGirl.create(:match, event: event)
    expect { MatchService.new(event).accept(match) }.to change{ match.status }.to("accepted")
    expect { MatchService.new(event).decline(match) }.to change{ match.status }.to("declined")
  end

  it 'should update the status of match on accepting or declining a match' do
    event = FactoryGirl.create(:event)
    match = FactoryGirl.create(:match, event: event)
    expect { MatchService.new(event).accept(match) }.to change{ event.status }.to("accepted")
  end
end
