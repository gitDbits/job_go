class HomeController < ApplicationController

  def index
    @companies = Company.all
    @categories = Category.all
    @jobs = Job.all
  end
end
