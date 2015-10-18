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

require 'rails_helper'

RSpec.describe Post, type: :model do
  it "is valid with a title, text and author" do
    expect(FactoryGirl.build(:post)).to be_valid
  end

  it "is invalid without a title" do
    post = FactoryGirl.build(:post, title: nil)
    expect(post).not_to be_valid
  end

  it "is invalid without a text" do
    post = FactoryGirl.build(:post, body: nil)
    expect(post).not_to be_valid
  end

  it "is invalid without an author" do
    post = FactoryGirl.build(:post, author: nil)
    expect(post).not_to be_valid
  end
end
