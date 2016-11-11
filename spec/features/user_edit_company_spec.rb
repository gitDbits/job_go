require 'rails_helper'

feature 'User edit a company' do

  scenario 'successfully' do
    company = Company.create(name: 'Campus Code',
                             location: 'Sao Paulo',
                             mail: 'campus@gmail.com',
                             phone: '11 2341-2345')

     visit edit_company_path(company)

     fill_in 'Nome', with: 'Google'

     click_on 'Atualizar Empresa'

     expect(page).to have_css('h1', text:'Google')
  end

  scenario 'unsuccessully' do
      company = Company.create(name: 'Campus Code',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476')

      visit edit_company_path(company)

      fill_in 'Nome', with: ''

      click_on 'Atualizar Empresa'

      expect(page).to have_content('Nome não pode ser vazio!')
  end

end
