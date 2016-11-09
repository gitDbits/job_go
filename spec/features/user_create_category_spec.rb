require 'rails_helper'

feature 'User create category' do
  scenario 'successfully' do
    category = Category.new(name: 'Desenvolvedor')

    visit new_category_path

    fill_in 'Nome', with: category.name

    click_on 'Criar Categoria'

    expect(page).to have_css('h1', text: category.name)
  end

  scenario 'unsuccessfully' do

    category = Category.create(name: 'Desenvolvedor')

    visit new_category_path

    fill_in 'Nome', with: ''

    click_on 'Criar Categoria'

    expect(page).to have_content('Nome não pode ser vazio!')

    fill_in 'Nome', with: category.name

    click_on 'Criar Categoria'

    expect(page).to have_content('Essa categoria já existe!')

  end
end
