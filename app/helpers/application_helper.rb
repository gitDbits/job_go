module ApplicationHelper
  # Padronizando data PT-BR
  def person_date(date)
    date.strftime('%d/%m/%Y')
  end
end
