class IdeaController < ApplicationController
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


  private

  def set_idea
    @idea = Idea.find(params[:id])
    authorize @idea
  end
end
