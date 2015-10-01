class Comment < ActiveRecord::Base
  validates_presence_of :body, :author
  belongs_to :commentable, :polymorphic => true
end
