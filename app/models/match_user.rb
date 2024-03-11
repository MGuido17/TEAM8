class MatchUser < ApplicationRecord
  belongs_to :match
  belongs_to :user
  validate :validate_match_users_limit, on: :create

  private

  def validate_match_users_limit
    if match.match_users.count >= 2
      error.add(:match, "can only be two users")
    end
  end
end
