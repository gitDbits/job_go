class Job < ApplicationRecord
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
