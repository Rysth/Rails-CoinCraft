class Movement < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
end
