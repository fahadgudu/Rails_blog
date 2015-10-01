class Post < ActiveRecord::Base
  validates_presence_of :body, :title, :author
  has_many :comments, :as => :commentable, :dependent => :delete_all
end
