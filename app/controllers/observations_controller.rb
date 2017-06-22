class ObservationsController < ApplicationController
  def index
    @observations = Observation.all
  end

  def new
    @experiment = Experiment.find_by(id: params[:id])
    @observation = Observation.new(observation_params)
  end

  def create
    @experiment = Experiment.find_by(id: params[:id])
    @observation = Observation.new(params[:observation])
    
    if @observation.save
    	redirect_to [:experiment, @observation]
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
  	@proposal = Proposal.find_by(id: params[:id])
    @proposal.destroy
   
    redirect_to observations_path
  end

  private
  def observation_params
    params.require(:observation).permit(:body)
  end
end

