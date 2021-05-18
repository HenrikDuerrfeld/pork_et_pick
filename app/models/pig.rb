class Pig < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  validates :name, presence: true
  validates :price_per_day, presence: true
  validates :description, presence: true
end
