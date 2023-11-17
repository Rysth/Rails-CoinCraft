class User < ApplicationRecord
  has_many :movements
  has_many :movements, through: :groups
end
