class ReportPdf < Prawn::Document
  def initialize(post)
    super()
    @post = post
    header
    text_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    text "#{@post.title}"
    text "#{@post.author} added #{@post.created_at.strftime('%b %d, %Y at %H:%M')}"
  end

  def text_content
    # The cursor for inserting content starts on the top left of the page. Here we move it down a little to create more space between the text and the image inserted above
    y_position = cursor - 50
    text "#{@post.body}"
    image "#{Rails.root}/public#{@post.image.data_url.to_s}" unless @post.image==nil 
  end
end