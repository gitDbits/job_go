require 'rails_helper'

feature 'User edit category' do
  scenario 'successfully' do

    category = Category.create(name: 'Desenvolvedor')

    new_category_name = 'Programador'

    visit edit_category_path(category)

    fill_in 'Nome', with: new_category_name

    click_on 'Atualizar Categoria'

    expect(page).to have_css('h1', text: new_category_name)

  end

  context 'unsuccessfully' do
    scenario 'with blank name' do
      category = Category.create(name: 'Desenvolvedor')

      visit edit_category_path category

      fill_in 'Nome', with: ''

      click_on 'Atualizar Categoria'

      expect(page).to have_content('Nome não pode ser vazio!')
    end

    scenario 'with duplicate name' do

      category_1 = Category.create(name: 'Desenvolvedor')
      category_2 = Category.create(name: 'Programador')

      visit edit_category_path category_1

      fill_in 'Nome', with: category_2.name

      click_on 'Atualizar Categoria'

      expect(page).to have_content('Essa categoria já existe!')
    end
  end
end
