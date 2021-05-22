class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :charities
  has_many :donations ,dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  scope :with_charities_count, -> {joins(:charities).select("users.*,COUNT(charities.id) AS charities_count").group("users.id")}
end
