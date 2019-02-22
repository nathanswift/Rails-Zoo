class CommentsController < ApplicationController
  before_action :set_animal

  def new
    @comment = Comment.new
  end

  def create
    @comment = @animal.comments.new(comment_params)

    if @comment.save
      redirect_to zoo_animal_path(@animal.zoo_id, @animal)
    else
      render :new
    end
  end

  private

  def set_animal
    @animal = Animal.find(params[:animal_id])  
  end

  def comment_params
    params.require(:comment).permit(:body, :author)  
  end
end
