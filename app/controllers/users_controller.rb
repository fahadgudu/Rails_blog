class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]

  def index
    @users = User.page(params[:page]).per(15)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @commentable = @user
    @comments = @commentable.comments
    @comment = Comment.new
    @user_tags = Tag.where(id: @user.tag_ids)
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
