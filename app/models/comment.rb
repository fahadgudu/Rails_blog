class Comment < ActiveRecord::Base
  validates_presence_of :body, :author
  validates :body, length: {maximum: 140}
  validates :commentable_type, inclusion: { in: %w(Event Post) }
  belongs_to :commentable, :polymorphic => true
end
