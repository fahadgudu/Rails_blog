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
#  settings   :hstore           default({}), not null
#

class Post < ActiveRecord::Base
  include Taggable
  include CustomFields
  before_validation :set_defaults

  validates_presence_of :body, :title, :author
  validates :title, length: {maximum: 255}
  validates :author, length: {maximum: 30}

  custom_fields :bgcolor, :font_size, :color

  has_many :comments, :as => :commentable, :dependent => :delete_all
  has_one :image, :as => :assetable, :dependent => :destroy
  accepts_nested_attributes_for :image

  protected
    def set_defaults
      self.bgcolor ||= "#ffffff"
      self.font_size ||= "14"
      self.color ||= "#000000"
    end
end
