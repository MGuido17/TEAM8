class Invite < ApplicationRecord
  belongs_to :user_one, class_name: "User", foreign_key: :user_one_id, dependent: :destroy
  belongs_to :user_two, class_name: "User", foreign_key: :user_two_id, dependent: :destroy
end
