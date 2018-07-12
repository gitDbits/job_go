require 'rails_helper'

feature 'User edit jobs' do
  scenario 'with valid fields' do
    company = Company.create(name: 'Google',
                             location: 'São Paulo',
                             mail: 'vagas@google.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Vaga de Dev',
                     category: category,
                     company: company,
                     description: 'Dev Junior Rails',
                     location: 'São Paulo')

    visit edit_job_path(job)

    fill_in 'Nome', with: 'Dev Android'
    fill_in 'Localização', with: 'Belo Horizonte'
    select category.name, from: 'Categoria'
    select company.name, from: 'Empresa'
    fill_in 'Descrição', with: 'Desenvolvedor de apps integradas via API'

    click_on 'ATUALIZAR VAGA'

    expect(page).to have_content('Vaga alterada com sucesso :)')
    expect(page).to have_content('Dev Android')
    expect(page).to have_content 'Belo Horizonte'
    expect(page).to have_content category.name
    expect(page).to have_content company.name
    expect(page).to have_content 'Desenvolvedor de apps integradas via API'
  end

  scenario 'change category and company' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Vaga de Dev',
                     category: category,
                     company: company,
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo')

    designer = Category.create(name: 'Designer')

    google = Company.create(name: 'Google',
                            location: 'São Paulo',
                            mail: 'google@gmail.com.br',
                            phone: '4444-8888')

    visit edit_job_path(job)

    select designer.name, from: 'Categoria'
    select google.name, from: 'Empresa'

    click_on 'ATUALIZAR VAGA'

    expect(page).to have_css('h1', text: job.title)
    expect(page).to have_content 'Designer'
    expect(page).to have_content 'Google'
  end

  scenario 'with category and company blank' do
    company = Company.create(name: 'Campus Code',
                             location: 'São Paulo',
                             mail: 'contato@campus.com.br',
                             phone: '2369-3476')

    category = Category.create(name: 'Desenvolvedor')

    job = Job.create(title: 'Vaga de Dev',
                     category: category,
                     company: company,
                     description: 'Dev Junior Rails com ao menos um projeto',
                     location: 'São Paulo')

    visit edit_job_path(job)

    select 'Escolha a categoria', from: 'Categoria'
    select 'Escolha a empresa', from: 'Empresa'

    click_on 'ATUALIZAR VAGA'

    expect(page).to have_content 'Verifique se a categoria e a empresa estão selecionadas.'
  end
end
