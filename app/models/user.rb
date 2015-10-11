# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string
#  surname    :string
#  city       :string
#  age        :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tag_ids    :integer          default([]), is an Array
#

class User < ActiveRecord::Base
  include Taggable
  validates_presence_of :name, :surname, :age
  validates :name, length: {maximum: 255}
  validates :surname, length: {maximum: 255}
  validates :age, numericality: { only_integer: true }

  has_many :comments, :as => :commentable, :dependent => :delete_all
  has_one :image, :as => :assetable, :dependent => :destroy
  accepts_nested_attributes_for :image
end
