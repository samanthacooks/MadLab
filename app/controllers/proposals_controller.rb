class ProposalsController < ApplicationController
  def index
    @proposals = Proposal.all
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    @proposal.proposer_id = current_user.id

    if @proposal.save
      redirect_to @proposal
    else
      render 'new'
    end
  end


  def show
    @proposal = Proposal.find_by(id: params[:id])
    @experiment = Experiment.new
  end

  def edit
    @proposal = Proposal.find_by(id: params[:id])
  end

  def update
  end


  def destroy
    @proposal = Proposal.find_by(id: params[:id])
    @proposal.destroy

    redirect_to proposals_path
  end

  private
  def proposal_params
    params.require(:proposal).permit(:summary, :hypothesis, :status, :proposer_id, :commentable)
  end
end
