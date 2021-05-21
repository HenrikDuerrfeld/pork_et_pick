class Review < ApplicationRecord
  belongs_to :pig
  belongs_to :user
  validates :review, length: { minimum: 20 }
  validates :review, length: { maximum: 200 }
end
