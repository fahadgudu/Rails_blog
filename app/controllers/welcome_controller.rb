class WelcomeController < ApplicationController
  def index
    @posts = Post.last(3).reverse
    @events = Event.last(3).reverse
    @tags = Tag.all
  end
end
