class Charity < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  validates :content, presence: true, length: { maximum: 1000 }

  belongs_to :user
  has_many :donations, dependent: :destroy
end
