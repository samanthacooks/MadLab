class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @experiment = Experiment.find_by(id: params[:experiment_id])
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = User.find_by(id:current_user.id).comments.new(
      body: params["comment"]["body"],
      user_id: current_user.id,
      commentable:Experiment.find_by(id:params["experiment_id"])
      )

    if @comment.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:commentable, :body,:user_id)
    end
end
