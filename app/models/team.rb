class Team < ApplicationRecord
  validates :code, :title, presence: true

  def full_name
    "#{code} : #{title}"
  end
end
