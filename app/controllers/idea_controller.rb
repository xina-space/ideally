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
    authorize @idea
  end

  def show
    authorize @activity
  end

  def edit
    authorize @activity
  end


  private

  def set_idea
    @idea = Idea.find(params[:id])
    authorize @idea
  end
end
