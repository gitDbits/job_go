class Company < ApplicationRecord
  has_many :jobs, dependent: :destroy

  def premium?
    if self.jobs.count >= 5
      true
    else
      false
    end
  end
end
