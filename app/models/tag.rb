class Tag < ApplicationRecord
  has_many :taggings, dependent: :destroy
  has_many :reviews, through: :taggings
end
