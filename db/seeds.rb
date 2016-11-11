# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# informações no banco para realização de testes!

@company = Company.create(name: 'Campus Code',
                          location: 'São Paulo',
                          phone: '11 2369 3476',
                          mail: 'contato@campuscode.com.br')

@category = Category.create(name: 'Desenvolvedor')


4.times do
  @company.jobs.create(title: 'Desenvolvedor Rails',
                       description: 'Desenvolvedor Full Stack Rails',
                       location: 'São Paulo - SP',
                       category: @category)
end

@company = Company.create(name: 'Google',
                          location: 'São Paulo',
                          phone: '11 2369 3476',
                          mail: 'contato@campuscode.com.br')

@category = Category.create(name: 'Java Programmer')



5.times do
  @company.jobs.create(title: 'Desenvolvedor Rails',
                       description: 'Desenvolvedor Full Stack Rails',
                       location: 'São Paulo - SP',
                       category: @category)
end

@company = Company.create(name: 'IBM',
                          location: 'São Paulo',
                          phone: '11 2369 3476',
                          mail: 'contato@campuscode.com.br')

@category = Category.create(name: 'Ruby Programmer')

10.times do
  @company.jobs.create(title: 'Desenvolvedor Rails',
                       description: 'Desenvolvedor Full Stack Rails',
                       location: 'São Paulo - SP',
                       category: @category)
end