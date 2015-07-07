class Movie < ActiveRecord::Base

  scope :top, -> { order(rank: :desc).limit(5) }
end
