require 'rails_helper'

feature 'User edit companies' do 
	scenario 'sucessfully' do
		company = Company.create(name: 'Kinyx Tecnologia', 
														 location: 'Rondônia',
														 mail: 'noronha@kinyx.com.br',
														 phone: '34412693')
		
		visit edit_company_path(company)

		fill_in 'Nome',  with: 'Campus Code'

		click_on 'Atualizar Empresa'

		expect(page).to have_css('h1', text:'Campus Code') 
	end
end