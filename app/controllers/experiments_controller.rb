class ExperimentsController < ApplicationController
  def index

  end

  def new
    @experiment = Experiment.new
    @experiment.proposal_id = Proposal.find_by(id: params[:id])
    @experiment.experimenter_id = current_user
    @proposal = Proposal.find_by(id: @experiment.proposal_id)

  end

  def create
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
