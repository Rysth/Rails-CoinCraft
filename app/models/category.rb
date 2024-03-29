class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :icon, presence: true

  belongs_to :user
  has_and_belongs_to_many :movements
end
