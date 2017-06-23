class ExperimentsController < ApplicationController
  def index

  end

  def new
    @proposal = Proposal.find_by(id:params[:id])
    @experiment = Experiment.new
  end

  def create
    experiment = current_user.experiments.new(
    category: params["experiment"]["category"],
    results: params["experiment"]["results"],
    conclusions: params["experiment"]["conclusions"],
    proposal_id: params[:proposal_id]
  )
     if experiment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @experiment = Experiment.find_by(id: params[:id])
  end

  def edit

  end

  def update
  end

  def destroy
  end

  private

  def experiment_params
    params.require(:experiment).permit(:category, :results, :conclusions)
  end
end
