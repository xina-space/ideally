class IdeasController < ApplicationController
  before_action :set_idea, only: %i[show edit update destroy]

  def index
    @ideas = policy_scope(Idea)
  end

  def new
    @idea = Idea.new
    authorize @idea
  end

  def create
    @idea = Idea.new
    @idea.user = current_user
    authorize @idea
    if @idea.save
      redirect_to idea_path(@idea)
    else
      render :new
    end
  end

  def show
    authorize @idea
  end

  def edit
    authorize @idea
  end

  def destroy
    authorize @idea
    @idea.destroy
    redirect to ideas_path
  end

  def update
    @idea.update(@idea_params)
    authorize @idea
    if @idea.update(idea_params)
      redirect_to ideas_path
    else
      render :edit
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:title, :completed, :status)
  end

  def set_idea
    @idea = Idea.find(params[:id])
    authorize @idea
  end
end
