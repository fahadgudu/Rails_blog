class Post < ActiveRecord::Base
  validates_presence_of :body, :title, :author
  validates :title, length: {maximum: 255}
  validates :author, length: {maximum: 30}
  has_many :comments, :as => :commentable, :dependent => :delete_all
  has_one :image, :as => :assetable, :dependent => :destroy
  accepts_nested_attributes_for :image
end
