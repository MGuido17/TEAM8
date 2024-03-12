class Activity < ApplicationRecord
  belongs_to :user
  has_many :attendees, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :reviews, dependent: :destroy
  serialize :recommended_conditions, type: Array, coder: JSON
  serialize :neutral_conditions, type: Array, coder: JSON
  serialize :not_recommended_conditions, type: Array, coder: JSON
  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validates :spaces, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :address, presence: true
  validates :location, presence: true
end
