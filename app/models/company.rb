class Company < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :jobs, dependent: :destroy

  validates :name, :location, :mail, :phone, presence: true

  validates :name, uniqueness: { }

  def premium?
    jobs.count >= 5
  end
end
