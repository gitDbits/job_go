require "rails_helper"

feature "User create jobs" do

  scenario "with valid job information" do

    company = Company.create(name: "Google",
                             location: "São Paulo",
                             mail: "vagas@google.com.br",
                             phone: "2369-3476")

    category = Category.create(name: "Backend Ruby on Rails")

    job = Job.new(title: "Dev Junior",
                  location: "São Paulo",
                  description: "Estágio para desenvolvedor júnior em Ruby on Rails")

    visit new_job_path

    fill_in "Nome", with: job.title
    fill_in "Localização",  with: job.location
    select  category.name,  from: "Categoria"
    select  company.name,   from: "Empresa"
    fill_in "Descrição",    with: job.description

    click_on "CRIAR"

    expect(page).to have_content("Vaga cadastrada com sucesso :)")
  end

  scenario "marked as featured" do

    company = Company.create(name: "Google",
                             location: "São Paulo",
                             mail: "vagas@google.com.br",
                             phone: "2369-3476")

    category = Category.create(name: "Desenvolvedor")

    job = Job.new(title: "Dev Master",
                  location: "Rio de Janeiro",
                  description: "Vaga para Dev Master para Bootcamp Rails")

    visit new_job_path

    fill_in "Nome", with: job.title
    fill_in "Local", with: job.location
    select  category.name, from: "Categoria"
    select  company.name, from: "Empresa"
    fill_in "Descrição", with: job.description
    check "Vaga em destaque?"

    click_on "CRIAR"

    expect(page).to have_content("Vaga cadastrada com sucesso :)")
    expect(page).to have_content(job.title)
    expect(page).to have_content(job.description)
    expect(page).to have_content(job.location)
    expect(page).to have_content(job.created_at)
    expect(page).to have_content(category.name)
    expect(page).to have_content (company.name)
    expect(page).to have_content("Vaga em destaque:")
  end

  context "with invalid information jobs" do

    scenario "category and company not selected" do

      job = Job.new(title: "Dev Junior",
                    location: "São Paulo",
                    description: "Estágio para desenvolvedor júnior em Ruby on Rails")

      visit new_job_path

      fill_in "Nome", with: job.title
      fill_in "Localização", with: job.location
      select "Escolha a categoria", from: "Categoria"
      select "Escolha a empresa", from: "Empresa"
      fill_in "Descrição", with: job.description

      click_on "CRIAR"

      expect(page).to have_current_path jobs_path
      expect(page).to have_content "Verifique se a categoria e a empresa estão selecionadas."
    end
  end
end
