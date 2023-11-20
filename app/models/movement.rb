class Movement < ApplicationRecord
  validates :name, presence: true
  validates :amount, presence: true, numericality: { alert: 'Must be a Number' }

  belongs_to :user, foreign_key: 'author_id'
  has_and_belongs_to_many :categories
end
