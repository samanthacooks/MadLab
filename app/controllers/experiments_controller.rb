class ExperimentsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
    render 'show'
    # @experiment = Experiment.find_by(experiment_params)

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def experiment_params
    params.require(:experiment).permit(:category, :results, :conclusions,:proposal_id,:experimenter_id)
  end
end
