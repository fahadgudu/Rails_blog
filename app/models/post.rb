# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  author     :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#

class Post < ActiveRecord::Base
  include Taggable
  validates_presence_of :body, :title, :author
  validates :title, length: {maximum: 255}
  validates :author, length: {maximum: 30}

  has_many :comments, :as => :commentable, :dependent => :delete_all
  has_one :image, :as => :assetable, :dependent => :destroy
  accepts_nested_attributes_for :image
end
