class WelcomeController < ApplicationController
  def index
    @posts = Post.last(3).reverse
    @events = Event.last(3).reverse
    @tags = Tag.all
    @entries = []
    @tags_hash = Hash.new(0)
    @content = ContentView.all

    # All credit goes to BugExplorer for this code
    
    @content.each do |content|
      content.tag_ids.each do |tag|
        @tags_hash[tag] += 1
      end
    end
    create_entries_array
  end

  private

    def create_entries_array
      _content_count = @content.size.to_f
      _tags_count = @tags.size.to_f
      @tags.each do |tag|
        # 68 - average number of tags; 61=68-10%; 76=68+10%
        css_class =
          case @tags_hash[tag.id]
            when 0..61 then 'sm'
            when 76.._content_count then 'lg'
            else 'st'
          end

        @entries << { tag: tag, css_class: css_class }
      end
  end
end
