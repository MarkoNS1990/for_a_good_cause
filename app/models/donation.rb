class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :charity

  validates :user_id, presence: true
  validates :charity_id, presence: true
end
