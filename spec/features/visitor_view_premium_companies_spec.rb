require 'rails_helper'

feature 'Visitor view premium companies' do
  scenario 'successfully' do
    company = Company.create(name: 'Google',
                             location: 'São Paulo',
                             phone: '11 2369 3476',
                             mail: 'vagas@google.com.br')

    category = Category.create(name: 'Desenvolvedor')

    5.times do
      company.jobs.create(title: 'Desenvolvedor Rails',
                          description: 'Desenvolvedor Full Stack Rails',
                          location: 'São Paulo - SP',
                          company: company,
                          category: category)
    end

    visit root_path

    expect(page).to have_content 'Premium'
  end
end
