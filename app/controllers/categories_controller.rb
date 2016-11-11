class CategoriesController < ApplicationController
  before_action :set_categories, only: [:show, 
                                        :edit, 
                                        :update]

  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category
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
    if @category.update(category_params)
      redirect_to @category
    else
      flash.now[:error] = 'Erro ao salvar :('
      render :edit
    end
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def set_categories
      @category = Category.find(params[:id])
    end
end