class Activity < ApplicationRecord
  belongs_to :user
  has_many :attendees
  has_many :bookmarks
  has_many :reviews
  serialize :recommended_conditions, type: Array, coder: JSON
  serialize :neutral_conditions, type: Array, coder: JSON
  serialize :not_recommended_conditions, type: Array, coder: JSON
  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :spaces, presence: true
  validates :recommended_conditions, presence: true
  validates :not_recommended_conditions, presence: true
  validates :address, presence: true
  validates :location, presence: true
end
