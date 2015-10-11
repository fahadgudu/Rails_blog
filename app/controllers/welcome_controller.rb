class WelcomeController < ApplicationController
  def index
    @posts = Post.last(3).reverse
    @events = Event.last(3).reverse
    @tags = Tag.all
    @entries = []
    @tags.each do |tag|
      tag_entries_count = ContentView.any_tags(tag.id).count
      _class =
        case tag_entries_count
          when 0..75 then 'sm'
          when 76..80 then 'nm'
          else 'bg'
        end

      @entries << { tag: tag, css_class: _class }
    end
  end
end
