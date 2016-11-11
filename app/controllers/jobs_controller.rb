class JobsController < ApplicationController
  before_action :set_job, only: [ :show, 
                                  :edit, 
                                  :update]
  before_action :set_references, only: [:new, 
                                        :update,
                                        :create, 
                                        :edit]

  def new
    @job = Job.new
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      flash[:sucesso] = 'Vaga cadastrada com sucesso'
      redirect_to @job
    else
      flash.now[:error] = 'Não foi possível criar a vaga'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job
    else
      flash.now[:error] = 'Não foi possível atualizar a vaga'
      render :edit
    end
  end

  private

    def job_params
      params.require(:job).permit( :title,
                                   :location,
                                   :category_id,
                                   :company_id,
                                   :description,
                                   :featured)
    end

    def set_job
        @job = Job.find(params[:id])
    end

    def set_references
      @companies = Company.all
      @categories = Category.all
    end
end
