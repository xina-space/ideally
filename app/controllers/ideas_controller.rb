class IdeasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category
  before_action :set_progress
  before_action :set_idea, only: %i[show edit update destroy]

  def index
    @ideas = policy_scope(Idea)
    # @ideas = Idea.all
  end

  def new
    @idea = @progress.ideas.new
    # if params[:id].present?
    #   @category_id = params[:id]
    # end
    authorize @idea
  end

  def create
    # @category = Category.find(params[:category_id])
    @idea = @progress.ideas.new(idea_params)
    # @idea.category = IdeaCategory.create(
    #   idea_id: @idea.id,
    #   category_id: @category.id
    # )
    # @idea.user = current_user
    authorize @idea
    if @idea.save
      # if params[:category][:id].present?
      #   @category = Category.find(params[:category][:id])
      #   IdeaCategory.create(idea: @idea, category: @category)
      # end
      redirect_to @category, notice: 'Your idea was added successfully'
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
    # authorize @idea
    @idea.destroy
    redirect_to @category, notice: 'The idea was successfully destroyed'
  end

  def update
    authorize @idea
    if @idea.update(idea_params)
      respond_to do |format|
        format.html { redirect_to @category, notice: 'Idea was successfully updated.' }
        format.json {}
      end
    else
      render :edit
    end
  end

  private

  # def find_category
  #   @category = Category.find(params[:category_id])
  # end

  def set_progress
    @progress = @category.progresses.find(params[:progress_id])
  end

  def set_category
    @category = current_user.categories.includes(progresses: :ideas).find(params[:category_id])
  end

  def set_idea
    @idea = @progress.ideas.find(params[:id])
    authorize @idea
  end

  def find_user
    @user = current_user.id
  end

  def idea_params
    # params.permit(:title, :description, :status)
    params.require(:idea).permit(:progress_id, :content)
  end
end
