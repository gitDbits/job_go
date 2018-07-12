require 'rails_helper'

feature 'User create category' do
  scenario 'with valid details' do
    category = Category.new(name: 'Back end Ruby on Rails')

    visit new_category_path

    fill_in 'Nome', with: category.name

    click_on 'CRIAR'

    expect(page).to have_content("Categoria #{category.name} não possui vagas.")
  end

  context 'with invalid details' do
    scenario 'blank name' do
      category = Category.create(name: 'Desenvolvedor')

      visit new_category_path

      fill_in 'Nome', with: ''

      click_on 'CRIAR'

      expect(page).to have_no_content(category.name)
    end

    scenario 'duplicate name' do
      category = Category.create(name: 'Desenvolvedor')

      visit new_category_path

      fill_in 'Nome', with: category.name

      click_on 'CRIAR'

      expect(page).to have_content('Essa categoria já existe.')
    end
  end
end
