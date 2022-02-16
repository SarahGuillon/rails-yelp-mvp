class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :category, presence: true,
    inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"],
    message: "%{value} seems wrong" }
  validates :name, :address, presence: true
end
