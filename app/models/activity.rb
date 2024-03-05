class Activity < ApplicationRecord
  belongs_to :user
  serialize :recommended_conditions, Array
  serialize :neutral_conditions, Array
  serialize :not_recommended_conditions, Array
  belongs_to :attendee
  has_many :bookmark
  has_many :review
end
