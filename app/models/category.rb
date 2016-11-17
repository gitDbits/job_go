class Category < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: :slugged

  has_many :jobs

  validates :name,
  					presence: { message: 'Nome não pode ser vazio!' },
    				uniqueness: { message: 'Essa categoria já existe!' }
end
