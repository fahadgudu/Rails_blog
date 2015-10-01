class Event < ActiveRecord::Base
  validates_presence_of :body, :title, :author, :start_time
  has_many :comments, :as => :commentable, :dependent => :delete_all
end
