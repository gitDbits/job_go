class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  belongs_to :company
  belongs_to :category

  validates :title, :location, :description, :category, presence: true

  def expired?
    created_at < 90.days.ago
  end

  def recent?
    created_at > 5.days.ago
  end

  def slug_candidates
    [
      [:title, :company_id]
    ]
  end
end
