class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :charities
  has_many :donations, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # rubocop:disable Layout/LineLength
  scope :with_charities_count, lambda {
                                 joins(:charities).select('users.*,COUNT(charities.id) AS charities_count').group('users.id')
                               }
  # rubocop:enable Layout/LineLength
end
