class Match < ApplicationRecord
  has_many :messages
  has_many :match_user
end
