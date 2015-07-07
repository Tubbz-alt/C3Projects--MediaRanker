class Book < ActiveRecord::Base
  validates :name, :author, :description, :rank, presence: true
  validates :name, :description, uniqueness: true
  validates :rank, numericality: { only_integer: true }

  scope :top, -> { order(rank: :desc).limit(3) }
end
