class ProposalsController < ApplicationController
  def index
    # binding.pry
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
    # binding.pry
    @proposal = Proposal.find(params[:id])
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def update
  end


  def destroy
    @proposal = Proposal.find(params[:id])
    @proposal.destroy

    redirect_to proposals_path
  end

  private
  def proposal_params
    params.require(:proposal).permit(:summary, :hypothesis, :status, :proposer_id, :commentable)
  end
end
