class Match < ApplicationRecord
  belongs_to :user_one, class: "User", foreign_key: :user_one_id
  belongs_to :user_two, class: "User", foreign_key: :user_two_id
end
