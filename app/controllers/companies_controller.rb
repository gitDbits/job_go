class CompaniesController < ApplicationController
  before_action :set_companies, only: [:show, 
                                      :edit,
                                      :update]
  def new
    @company = Company.new
  end

  def create
    @company = Company.new(company_params)
    if @company.save
      redirect_to @company
    else
      flash.now[:error] = 'Erro ao salvar :('
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @company.update(company_params)
      redirect_to @company
    else
      flash.now[:error] = 'Erro ao salvar :('
      render :edit
    end
  end

  private

    def company_params
      params.require(:company).permit(:name, :location,:mail,:phone)
    end

    def set_companies
      @company = Company.friendly.find(params[:id])  
    end
end