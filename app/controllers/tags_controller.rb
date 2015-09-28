class TagsController < ApplicationController

  def index
    @tags = Tag.user_people
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new.(params.require.(:tag).permit(:name, :tagable_id))
    if @tag.save
      flash[:notice] = "Tag was created."
    else
      flash[:alert] = "There was an error saving the comment. Please try again."
    end
  end

  def destroy
    @tag = Tag.find(params[:tag_id])
    
    if @tag.destroy
      flash[:notice] = "Comment was removed."
      redirect_to [@personal_event]
    else
      flash[:alert] = "Comment couldn't be deleted. Try again."
      redirect_to [@personal_event]
    end

     respond_to do |format|
       format.html
       format.js
     end
   end

end
