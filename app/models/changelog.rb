class Changelog < ApplicationRecord
  validates :title, presence: true
  validates :version, presence: true
  validates :published_at, presence: true
  
  # Default scope to order by published_at in descending order
  scope :by_published_date, -> { order(published_at: :desc) }
end