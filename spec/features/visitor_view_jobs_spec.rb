require 'rails_helper'

feature 'Visitor view jobs on home page' do
  scenario 'successfully' do
    company = Company.create(name: 'Google',
                             location: 'São Paulo',
                             mail: 'vagas@google.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    Job.create(title: 'Vaga de Dev',
               category: category,
               company: company,
               description: 'Dev Junior Rails com ao menos um projeto',
               location: 'São Paulo')

    visit root_path

    expect(page).to have_content('Vaga de Dev')
    expect(page).to have_content('Google')
    expect(page).to have_content('São Paulo')
    expect(page).not_to have_content('Destaque')
  end

  scenario 'and view a list of jobs' do
    company = Company.create(name: 'Google',
                             location: 'São Paulo',
                             mail: 'vagas@google.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Vaga de Dev',
                     category: category,
                     company: company,
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo')

    another_job = Job.create(title: 'UX Senior',
                             company: company,
                             category: category,
                             description: 'UX com experiência em redes sociais',
                             location: 'São Paulo',
                             featured: true)
    visit root_path

    expect(page).to have_content job.title
    expect(page).to have_content job.description
    expect(page).to have_content job.location
    expect(page).to have_content category.name
    expect(page).to have_content company.name
    expect(page).to have_link 'VER DETALHES'
    expect(page).to have_link 'EDITAR'
    expect(page).to have_link 'DELETAR'
  end

  scenario 'not content jobs' do
    category = Category.create(name: 'Desenvolvedor')

    company = Company.create(name: 'Google',
                             location: 'São Paulo',
                             mail: 'vagas@google.com.br',
                             phone: '2369-3476')

    visit root_path

    expect(page). to have_content('Nenhuma vaga disponível')
  end
end
