require 'rails_helper'

feature 'User create companies' do
  scenario 'successfully' do
    company = Company.new(name: 'Campus Code',
                          location: 'São Paulo',
                          mail: 'contato@campus.com.br',
                          phone: '2369-3476')

    visit new_company_path

    fill_in 'Nome',      with: company.name
    fill_in 'Local',     with: company.location
    fill_in 'Email',     with: company.mail
    fill_in 'Telefone',  with: company.phone

    click_on 'Criar Empresa'

    expect(page).to have_css('h1', text: company.name)
    expect(page).to have_content(company.location)
    expect(page).to have_content(company.mail)
    expect(page).to have_content(company.phone)
  end

  context 'unsuccessully' do
    scenario 'with empty field' do
      company = Company.new(name: 'Campus Code',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476')

      visit new_company_path

      fill_in 'Nome',      with: ''
      fill_in 'Local',     with: company.location
      fill_in 'Email',     with: company.mail
      fill_in 'Telefone',  with: company.phone

      click_on 'Criar Empresa'

      expect(page).to have_current_path companies_path
      expect(page).to have_content('Nome não pode ser vazio!')

    end
    scenario 'with duplicated name' do
      Company.create(name: 'Campus Code',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476')

      company = Company.new(name: 'Campus Code',
                            location: 'São Paulo',
                            mail: 'contato@campus.com.br',
                            phone: '2369-3476')

      visit new_company_path

      fill_in 'Nome',      with: company.name
      fill_in 'Local',     with: company.location
      fill_in 'Email',     with: company.mail
      fill_in 'Telefone',  with: company.phone

      click_on 'Criar Empresa'

      expect(page).to have_current_path companies_path
      expect(page).to have_content('Essa empresa já existe!')
    end
  end
end
