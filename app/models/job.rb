class Job < ApplicationRecord
  validates :title, :location, :description, presence: true
  belongs_to :company
  belongs_to :category
end
