require 'rails_helper'

feature 'User create companies' do
  scenario 'successfully' do
    company = Company.new(name: 'Google',
                          location: 'São Paulo',
                          mail: 'vagas@google.com.br',
                          phone: '11 35111 1415')

    visit new_company_path

    fill_in 'Nome', with: company.name
    fill_in 'Localização', with: company.location
    fill_in 'E-mail', with: company.mail
    fill_in 'Telefone', with: company.phone

    click_on 'CRIAR'

    expect(page).to have_content("Empresa #{company.name} não possui nenhuma vaga.")
  end

  context 'unsuccessully' do
    scenario 'with empty field' do
      company = Company.new(name: 'Google',
                            location: 'São Paulo',
                            mail: 'vagas@google.com.br',
                            phone: '2369-3476')

      visit new_company_path

      fill_in 'Nome', with: ''
      fill_in 'Localização', with: company.location
      fill_in 'E-mail', with: company.mail
      fill_in 'Telefone', with: company.phone

      click_on 'CRIAR'

      expect(page).to have_current_path companies_path
      expect(page).to have_no_content('Empresa cadastrada com sucesso :)')
    end
    scenario 'with duplicated name' do
      company = Company.create(name: 'Google')

      visit new_company_path

      fill_in 'Nome', with: company.name
      fill_in 'Localização', with: company.location
      fill_in 'E-mail', with: company.mail
      fill_in 'Telefone', with: company.phone

      click_on 'CRIAR'

      expect(page).to have_content('Essa empresa já existe.')
    end
  end
end
