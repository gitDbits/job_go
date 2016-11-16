class Job < ApplicationRecord
  extend FriendlyId
  friendly_id :slug_candidates, 
    use: :slugged

  def slug_candidates
    [
      [:title, :company_id]
    ]
  end

  validates :title, 
  			:location,
  			:description,
  			presence: true
  			
  belongs_to :company
  belongs_to :category

  def expired?
    created_at < 90.days.ago
  end
end
