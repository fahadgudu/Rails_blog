# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_id   :integer
#  commentable_type :string
#  author           :string
#  body             :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ActiveRecord::Base
  validates_presence_of :body, :author
  validates :body, length: {maximum: 140}
  validates :commentable_type, inclusion: { in: %w(Event Post) }
  belongs_to :commentable, :polymorphic => true
end
