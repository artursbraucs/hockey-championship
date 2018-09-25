module ScoresHelper
  def team_full_name(team)
    return ' -- no team --' if team.blank?
    return team.title if team.code.blank?

    "#{team.code} - : - #{team.title}"
  end
end
