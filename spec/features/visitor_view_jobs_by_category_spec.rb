require 'rails_helper'

feature 'Visitor view jobs by category' do
  scenario 'successfully' do
    category = Category.create(name: 'Desenvolvedor Mobile')

    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    job = Job.create(title: 'Dev Master',
                     location: 'Rio de Janeiro',
                     company: company,
                     category: category,
                     description: 'Vaga para Dev Master para Bootcamp Rails')

    another_job = Job.create(title: 'Dev Java Senior',
                             location: 'São Paulo',
                             company: company,
                             category: category,
                             description: 'Dev com experiência em Java 8')

    visit root_path

    click_on category.name

    expect(page).to have_css('h3', text: "Lista de vagas #{category.name}")

    expect(page).to have_content job.title
    expect(page).to have_content job.description
    expect(page).to have_content job.location
    expect(page).to have_content category.name
    expect(page).to have_content company.name
    expect(page).to have_link 'VER DETALHES'
    expect(page).to have_link 'EDITAR'
    expect(page).to have_link 'DELETAR'

    expect(page).to have_content another_job.title
    expect(page).to have_content another_job.description
    expect(page).to have_content another_job.location
    expect(page).to have_content another_job.category.name
    expect(page).to have_content another_job.company.name
  end

  scenario 'and view only the current category jobs' do
    company = Company.create(name: 'Google',
                             location: 'São Paulo',
                             mail: 'vagas@google.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Dev Master',
                     location: 'Rio de Janeiro',
                     company: company,
                     category: category,
                     description: 'Vaga para Dev Master para Bootcamp Rails')

    another_category = Category.create(name: 'Analista QA')

    another_job = Job.create(title: 'QA Java Senior',
                             location: 'São Paulo',
                             company: company,
                             category: another_category,
                             description: 'QA com experiência em Java 8')

    visit root_path

    click_on another_category.name

    expect(page).to have_css('h3', text: "Lista de vagas #{another_category.name}")
    expect(page).to have_content another_job.title
    expect(page).to have_content another_job.description
    expect(page).to have_content another_job.location
    expect(page).to have_content another_job.category.name
    expect(page).to have_content another_job.company.name
  end

  scenario 'category not jobs' do
    category = Category.create(name: 'Gerente')

    visit root_path

    click_on category.name

    expect(page).to have_content "Categoria #{category.name} não possui vagas."
  end
end
