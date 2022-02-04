class IdeasController < ApplicationController
  before_action :set_idea, only: %i[show edit update destroy]
  before_action :find_category, except: :destroy
  # before_action :find_user

  def index
    @ideas = policy_scope(Idea)
  end

  def new
    @idea = Idea.new(idea_params)
    authorize @idea
  end

  def create
    @idea = Idea.new(idea_params)
    @idea.category = @category
    @idea.user = current_user
    authorize @idea
    if params[:category][:id].present?
      @idea = Idea.find(params[:category][:id])
      IdeaCategory.create(idea: @idea, category: @category)
    end
    if @idea.save
      redirect_to category_ideas_path(@category)
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
    @idea.update(idea_params)
    authorize @idea
    if @idea.update(idea_params)
      redirect_to ideas_path
    else
      render :edit
    end
  end

  private

  def find_category
    @category = Category.find(params[:category_id])
  end

  # def find_user
  #   @user = current_user.id
  # end

  def idea_params
    params.require(:idea).permit(:title, :description, :status, :category_id)
  end

  def set_idea
    @idea = Idea.find(params[:id])
    authorize @idea
  end
end
