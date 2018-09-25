class Score < ApplicationRecord
  belongs_to :home_team, class_name: 'Team'
  belongs_to :visitor_team, class_name: 'Team'

  validates :home_team_id, :visitor_team_id, :visitor_goals, :home_goals, presence: true
  validates :visitor_goals, :home_goals, numericality: { greater_than_or_equal_to: 0 }
  validate :goals_difference, if: -> { visitor_goals.present? && home_goals.present? }

  def points_for_winner_team
    return 0 if winner_team.nil?
    return 2 if overtime
    3
  end

  def winner_team
    if home_goals > visitor_goals
      home_team
    elsif home_goals < visitor_goals
      visitor_team
    else
      nil
    end
  end

  private

  def goals_difference
    errors.add(:base, 'Result cannot be tie!') if home_goals == visitor_goals
  end
end
