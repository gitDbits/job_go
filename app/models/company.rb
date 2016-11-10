class Company < ApplicationRecord

	validates :name, 
						:location, 
						:mail, 
						:phone, 
						 presence: { message: 'Preencher o nome' }		
  has_many :jobs, dependent: :destroy

  def premium?
    if self.jobs.count >= 5
      true
    else
      false
    end
  end
end
