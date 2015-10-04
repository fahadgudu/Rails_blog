class Event < ActiveRecord::Base
  validates_presence_of :body, :title, :author, :start_time
  has_many :comments, :as => :commentable, :dependent => :delete_all
  has_one :image, :as => :assetable, :dependent => :destroy
  has_one :attachment, :as => :assetable, :dependent => :destroy
  accepts_nested_attributes_for :image
  accepts_nested_attributes_for :attachment
end
