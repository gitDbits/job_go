require 'rails_helper'

feature 'Visitor visits Job GO! home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Job GO!')
  end
end
