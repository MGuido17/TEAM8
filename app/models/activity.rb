class Activity < ApplicationRecord
  belongs_to :user
  has_many :attendees, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  serialize :recommended_conditions, type: Array, coder: JSON
  serialize :neutral_conditions, type: Array, coder: JSON
  serialize :not_recommended_conditions, type: Array, coder: JSON
end
