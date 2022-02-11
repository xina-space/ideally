class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]

  def index
    @user = current_user
    @categories = policy_scope(Category)
    @user_categories = Category.where(user_id: current_user.id)

  end

  def new
    @category = Category.new
    authorize @category
    if params[:id].present?
      @idea_id = params[:id]
    end
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    @category.user = current_user
    if @category.save
      if params[:category][:id].present?
        @idea = Idea.find(params[:category][:id])
        IdeaCategory.create(idea: @idea, category: @category)
      end
      redirect_to categories_path
    else
      render :new
    end
  end

  def show
    # authorize @ideas
    # @category = Category.where.not(user_id: current_user.id)
    authorize @category
  end

  def edit
    authorize @category
  end

  def update
    authorize @category
    @category.update(category_params)
    if @category.update(category_params)
      redirect_to categories_path
    else
      render :edit
    end
  end

  def destroy
    authorize @category
    @category.destroy
    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:title)
  end
end
