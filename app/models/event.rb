# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  title      :string
#  start_time :string
#  body       :text
#  author     :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  city       :text             default("Nowhere")
#  tag_ids    :integer          default([]), is an Array
#

class Event < ActiveRecord::Base
  include Taggable
  validates_presence_of :body, :title, :author, :start_time
  validates :title, length: {maximum: 255}
  validates :author, length: {maximum: 30}
  validates :start_time, length: {maximum: 75}

  has_many :comments, :as => :commentable, :dependent => :delete_all
  has_one :image, :as => :assetable, :dependent => :destroy
  has_one :attachment, :as => :assetable, :dependent => :destroy
  accepts_nested_attributes_for :image
  accepts_nested_attributes_for :attachment
end
