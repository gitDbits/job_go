class JobsController < ApplicationController
  before_action :set_job, only: [ :show,
                                  :edit,
                                  :update
                                  ]
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
      redirect_to @job, success: "Vaga cadastrada com sucesso :)"
    else
      flash[:warning] = "Verifique se a categoria e a empresa estão selecionadas."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @job.update(job_params)
      redirect_to @job, success: "Vaga alterada com sucesso :)"
    else
      flash[:warning] = "Verifique se a categoria e a empresa estão selecionadas."
      render :edit
    end
  end

  def destroy
    @job = Job.friendly.find(params[:id])
    @job.destroy

    redirect_to root_path, danger: "Vaga excluída com sucesso :("
  end

  private

  def job_params
    params.require(:job).permit(:title,
                                :location,
                                :category_id,
                                :company_id,
                                :description,
                                :featured)
  end

  def set_job
    @job = Job.friendly.find(params[:id])
  end

  def set_references
    @companies = Company.all
    @categories = Category.all
  end
end
