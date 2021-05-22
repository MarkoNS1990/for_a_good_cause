class Charity < ApplicationRecord
  validates :name, presence: true
  validates :content, presence: true, length: { maximum: 1000 }

  belongs_to :user
  has_many :donations, dependent: :destroy

  
end
