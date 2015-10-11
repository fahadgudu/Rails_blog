class TagsController < ApplicationController
  before_action :find_tag

  def show
    @contents = ContentView.any_tags(@tag.id).recently.page(params[:page]).per(25)
  end

  protected
    def find_tag
      @tag = Tag.where(slug: params[:id]).first
    end
end
