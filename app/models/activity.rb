class Activity < ApplicationRecord
  belongs_to :user
  has_many :attendees
  has_many :bookmarks
  has_many :reviews
  serialize :recommended_conditions, type: Array, coder: JSON
  serialize :neutral_conditions, type: Array, coder: JSON
  serialize :not_recommended_conditions, type: Array, coder: JSON
end
