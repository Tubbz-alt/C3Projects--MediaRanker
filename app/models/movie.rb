class Movie < ActiveRecord::Base
  validates :name, :director, :description, :rank, presence: true
  validates :name, :description, uniqueness: true
  validates :rank, numericality: { only_integer: true }

  scope :top, -> { order(rank: :desc).limit(3) }
end
