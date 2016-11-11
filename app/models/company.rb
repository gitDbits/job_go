class Company < ApplicationRecord
  validates :name, 
  			:location,
  			:mail,
  			:phone,
  			presence: 
					{message: 'Nome não pode ser vazio!'}

  validates :name,
  	uniqueness: 
  		{ message: 'Essa empresa já existe!'}  
  
  has_many :jobs, dependent: :destroy

  def premium?
    jobs.count >= 5
  end
end
