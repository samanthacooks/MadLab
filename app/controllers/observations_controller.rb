class ObservationsController < ApplicationController
  def index
    @observations = Observation.all
  end

  def new
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @observation = Observation.new
  end

  def create
    experiment = Experiment.find_by(id: params[:experiment_id])
    @observation = experiment.observations.new(
      body:params["observation"]["body"],
      observable: experiment
      )
    if @observation.save
    	redirect_to root_path
    else
    	render 'new'
    end
  end

  def show
    @experiment = Experiment.find_by(id: params[:id])
    @observation = Observation.find_by(id:params[:id])
  end

  def edit
    @observation = Observation.find_by(id:params[:id])
  end

	def update
	end

  def destroy
    observation = Observation.find_by(id:params[:id]).destroy
    if observation.nil?
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private
  def observation_params
    params.require(:observation).permit(:body,:observable)
  end
end

