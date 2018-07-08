require "rails_helper"

feature "Visitor does not see expired jobs" do

  scenario "has not experied" do

    company = Company.create(name: "Google",
                              location: "São Paulo",
                              phone: "11 2369 3476",
                              mail: "vaga@google.com.br")

    category = Category.create(name: "Backend Ruby on Rails")

    travel_to 91.days.ago do
      company.jobs.create(title: "Desenvolvedor Rails",
                          description: "Desenvolvedor Full Stack Rails",
                          location: "São Paulo - SP",
                          category: category)
    end

    visit root_path

    expect(page).not_to have_content("Desenvolvedor Rails")
  end
end
