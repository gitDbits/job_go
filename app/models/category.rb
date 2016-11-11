class Category < ApplicationRecord
  validates :name, 
	presence: { message: 'Nome não pode ser vazio!'},
    uniqueness: { message: 'Essa categoria já existe!' }

  has_many :jobs
end
