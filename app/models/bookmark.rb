class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :school
  has_many :bookmarks
end
