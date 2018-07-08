require "rails_helper"

feature "Visitor visits job" do

  scenario "successfully" do
    company = Company.create(name: "Google",
                             location: "São Paulo",
                             mail: "vagas@google.com.br",
                             phone: "2369-3476")

    category = Category.create(name: "Desenvolvedor")

    job = Job.create(title: "Vaga de Dev",
                     category: category,
                     company: company,
                     description: "Dev Junior Rails com ao menos um projeto",
                     location: "São Paulo")

    visit root_path

    expect(page).to have_link("Criar vaga")
    expect(page).to have_link("Criar empresa")
    expect(page).to have_link("Criar categoria")
    expect(page).to have_link("Blog", :href=>"http://diegonoronha.com.br")

    expect(page).to have_content job.title
    expect(page).to have_content job.description
    expect(page).to have_content job.location
    expect(page).to have_content category.name
    expect(page).to have_content company.name
    expect(page).to have_link "VER DETALHES"
    expect(page).to have_link "EDITAR"
    expect(page).to have_link "DELETAR"

    click_on "Criar vaga"

    expect(page).to have_current_path new_job_path
  end

  scenario "and return to home" do
    company = Company.create(name: "Google",
                             location: "São Paulo",
                             mail: "vagas@google.com.br",
                             phone: "2369-3476")

    category = Category.create(name: "Desenvolvedor")

    job = Job.create(title: "Vaga de Dev",
                     category: category,
                     company: company,
                     description: "Dev Junior Rails com ao menos um projeto",
                     location: "São Paulo")

    visit job_path(job)

    click_on "VOLTAR"

    expect(current_path).to eq(root_path)
  end
end
