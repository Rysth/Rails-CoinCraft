class Movement < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  validates :amount, numericality: { alert: 'Must be a Number' }
  has_and_belongs_to_many :categories
end
