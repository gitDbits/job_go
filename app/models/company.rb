class Company < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :jobs, dependent: :destroy

  validates :name, :location, :mail, :phone,
            presence: { message: 'Nome não pode ser vazio!' }

  validates :name, uniqueness: { message: 'Essa empresa já existe!' }

  def premium?
    jobs.count >= 5
  end
end
