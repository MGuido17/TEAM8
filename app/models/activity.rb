class Activity < ApplicationRecord
  belongs_to :user
  has_many :attendees
  has_many :bookmarks
  has_many :reviews
  serialize :recommended_conditions, Array
  serialize :neutral_conditions, Array
  serialize :not_recommended_conditions, Array
end
