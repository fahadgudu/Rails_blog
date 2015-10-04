class Post < ActiveRecord::Base
  validates_presence_of :body, :title, :author
  has_many :comments, :as => :commentable, :dependent => :delete_all
  has_one :image, :as => :assetable, :dependent => :destroy
  accepts_nested_attributes_for :image
end
