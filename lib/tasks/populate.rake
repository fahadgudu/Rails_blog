require "open-uri"

namespace :populate do 
  desc "Create random posts"
  task :posts => [:environment] do
    tags = [1,2,3,4,5,6,7,8,9,10]
    Post.populate(150..200) do |post|
      post.title = Populator.sentences(1)
      post.body = Populator.paragraphs(2..5)
      post.author = Faker::Name.name
      post.tag_ids = "{#{tags.sample(Random.new.rand(2..5)).join(",")}}"
      Comment.populate(1..10) do |comment|
        comment.commentable_id = post.id
        comment.commentable_type = "Post"
        comment.author = Faker::Internet.user_name
        comment.body = Populator.sentences(1..5)
      end
    end
  end
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  #BEWARE! THIS MUST BE INSIDE :posts TASK! 
  #!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  task :images => [:environment] do
    i=12000
    post_no = Post.last.id #latest added post
    Asset.populate(50..100) do |asset|
      begin
        Dir.mkdir("#{Rails.root}/public/uploads/image/data/#{asset.id}")
        open("#{Rails.root}/public/uploads/image/data/#{asset.id}/image-#{i}.jpg", 'wb') do |file|
          file << open("http://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-#{i}.jpg").read
        end
        image = Magick::Image.read("#{Rails.root}/public/uploads/image/data/#{asset.id}/image-#{i}.jpg").first
        image.resize_to_fit!(800, 10000)
        image.write("#{Rails.root}/public/uploads/image/data/#{asset.id}/image-#{i}.jpg")
        asset.assetable_id = post_no
        asset.assetable_type = 'Post'
        asset.filename = "image-#{i}.jpg"
        asset.type = "Image"
        post_no = post_no - 1
        i = i+1
      rescue OpenURI::HTTPError => e
        if e.message == '404 Not Found'
          begin
            open("#{Rails.root}/public/uploads/image/data/#{asset.id}/image-#{i}.jpg", 'wb') do |file|
              file << open("http://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-12000.jpg").read
            end
            image = Magick::Image.read("#{Rails.root}/public/uploads/image/data/#{asset.id}/image-#{i}.jpg").first
            image.resize_to_fit!(800, 10000)
            image.write("#{Rails.root}/public/uploads/image/data/#{asset.id}/image-#{i}.jpg")
            asset.assetable_id = post_no
            asset.assetable_type = 'Post'
            asset.filename = "image-#{i}.jpg"
            asset.type = "Image"
            post_no = post_no - 1
            i = i+1
          end
        else
          raise e
        end
      end
    end
  end

  task :image => [:environment] do
    i=12000
    post_no = 60 #latest added post
    #@post = Post.find(60)
    #@post.build_image
    Asset.populate(1) do |asset|
      Dir.mkdir("#{Rails.root}/public/uploads/image/data/#{asset.id}")
      open("#{Rails.root}/public/uploads/image/data/#{asset.id}/image-#{i}.jpg", 'wb') do |file|
        file << open("http://wallpapers.wallhaven.cc/wallpapers/full/wallhaven-#{i}.jpg").read
      end
      image = Magick::Image.read("#{Rails.root}/public/uploads/image/data/#{asset.id}/image-#{i}.jpg").first
      image.resize_to_fit!(800, 10000)
      image.write("#{Rails.root}/public/uploads/image/data/#{asset.id}/image-#{i}.jpg")
      asset.assetable_id = post_no
      asset.assetable_type = "Post"
      asset.filename = "image-#{i}.jpg"
      asset.type = "Image"
    end
  end

  desc "Create random events"
  task :events => [:environment] do
    tags = [1,2,3,4,5,6,7,8,9,10]
    Event.populate(30..40) do |event|
      event.title = Populator.sentences(1)
      event.body = Populator.paragraphs(2..5)
      event.author = Faker::Name.name
      event.start_time = Faker::Date.between(5.days.ago, 365.days.from_now)
      event.city = Faker::Address.city
      event.tag_ids = "{#{tags.sample(Random.new.rand(2..5)).join(",")}}"
      Comment.populate(1..10) do |comment|
        comment.commentable_id = event.id
        comment.commentable_type = "Event"
        comment.author = Faker::Internet.user_name
        comment.body = Populator.sentences(1..5)
      end
    end
  end

  desc "Create random users"
  task :users => [:environment] do
    tags = [1,2,3,4,5,6,7,8,9,10]
    User.populate(10..15) do |user|
      user.username = Faker::Internet.user_name
      user.surname = Faker::Name.name
      user.city = Faker::Address.city
      user.age = Random.new.rand(18..55)
      user.tag_ids = "{#{tags.sample(Random.new.rand(2..5)).join(",")}}"
      Comment.populate(1..10) do |comment|
        comment.commentable_id = user.id
        comment.commentable_type = "User"
        comment.author = Faker::Internet.user_name
        comment.body = Populator.sentences(1..5)
      end
    end
  end
end