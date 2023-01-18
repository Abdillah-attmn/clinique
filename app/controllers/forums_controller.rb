class ForumsController < ApplicationController
  before_action :set_forum, only: %i[show]
  def index
    @forums = Forum.all
  end

  def show
  end

  def new
    @forum = Forum.new
  end

  def create
    @forum = Forum.new(forum_params)
    @forum.user = current_user
    if @forum.save!
      redirect_to forums_path, notice:
    else
      render :new, status: :unprocessable_entity
    end
  end
  private

  def set_forum
    @forum = Forum.find(params[:id])
  end

  def forum_params
    params.require(:forum).permit(:question)
  end
end
