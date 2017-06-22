class ExperimentsController < ApplicationController
  def index

  end

  def new
    @experiment = Experiment.new
  end

  def create
  end

  def show
    @experiment = Experiment.find_by(id: params[:id])
    render 'show'
    # binding.pry
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
