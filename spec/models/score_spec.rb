RSpec.describe Score do
  describe '#points_for_winner_team' do
    context 'when overtime is true' do
      it 'returns points for overtime game' do
        score = Score.new(overtime: true)

        expect(score.points_for_winner_team).to eq(1)
      end
    end

    context 'when overtime is false' do
      it 'returns points for regular game' do
        score = Score.new

        expect(score.points_for_winner_team).to eq(2)
      end
    end
  end

  describe '#winner_team' do
    context 'when home team scores more goals' do
      it 'returns home team' do
        home_team = Team.new(code: 'HOME')
        visitor_team = Team.new(code: 'VISITOR')
        score = Score.new(home_team: home_team, visitor_team: visitor_team)
        score.home_goals = 2
        score.visitor_goals = 1

        expect(score.winner_team.code).to eq('HOME')
      end
    end

    context 'when visitor team scores more goals' do
      it 'returns home team' do
        home_team = Team.new(code: 'HOME')
        visitor_team = Team.new(code: 'VISITOR')
        score = Score.new(home_team: home_team, visitor_team: visitor_team)
        score.home_goals = 1
        score.visitor_goals = 2

        expect(score.winner_team.code).to eq('VISITOR')
      end
    end
  end
end
