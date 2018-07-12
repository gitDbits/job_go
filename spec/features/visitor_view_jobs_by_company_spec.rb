require 'rails_helper'

feature 'Visitor view jobs by company' do
  scenario 'successfully' do
    category = Category.create(name: 'Desenvolvedor')

    company = Company.create(name: 'Google',
                             location: 'São Paulo',
                             mail: 'vagas@google.com.br',
                             phone: '2369-3476')

    job = Job.create(title: 'Dev Master',
                     location: 'Rio de Janeiro',
                     company: company,
                     category: category,
                     description: 'Vaga para Dev Master para Bootcamp Rails')

    visit root_path

    click_on 'Vamos lá'

    expect(page).to have_css('h3', text: "Lista de vagas #{company.name}")

    expect(page).to have_content job.title
    expect(page).to have_content job.description
    expect(page).to have_content job.location
    expect(page).to have_content category.name
    expect(page).to have_content company.name
    expect(page).to have_link 'VER DETALHES'
    expect(page).to have_link 'EDITAR'
    expect(page).to have_link 'DELETAR'

    expect(page).to have_content job.title
    expect(page).to have_content job.description
    expect(page).to have_content job.location
    expect(page).to have_content job.category.name
    expect(page).to have_content job.company.name
  end

  scenario 'view a friendly message' do
    company = Company.create(name: 'Google',
                             location: 'São Paulo',
                             mail: 'vagas@google.com.br',
                             phone: '2369-3476')

    visit root_path

    click_on 'Vamos lá'

    expect(page).to have_content "Empresa #{company.name} não possui nenhuma vaga."
  end
end
