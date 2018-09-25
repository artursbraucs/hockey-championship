class Player < ApplicationRecord
  belongs_to :team

  validates :name, :number, :position, :club, :team_id, presence: true
end
