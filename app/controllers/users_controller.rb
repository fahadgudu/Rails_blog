class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(15)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
    @commentable = @user
    @comments = @commentable.comments
    @comment = Comment.new
    @user_tags = Tag.where(id: @user.tag_ids)
    respond_to do |format|
      format.html
    end
  end
end
