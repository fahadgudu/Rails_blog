require 'rails_helper'

RSpec.describe Comment, type: :model do
  it "is valid with an author name, text and commentable type" do
    expect(FactoryGirl.build(:comment)).to be_valid
  end

  it "is not valid without an author name" do
    comment = FactoryGirl.build(:comment, author: nil)
    expect(comment).not_to be_valid
  end
  it "is valid with commentable_type Event" do
    comment = FactoryGirl.build(:comment, commentable_type: "Event")
    expect(comment).to be_valid
  end
  it "is valid with commentable_type Post" do
    comment = FactoryGirl.build(:comment, commentable_type: "Post")
    expect(comment).to be_valid
  end

  it "is invalid without a content" do
    comment = FactoryGirl.build(:comment, body: nil)
    expect(comment).not_to be_valid
  end

  it "is invalid without a commentable type" do
    comment = FactoryGirl.build(:comment, commentable_type: nil)
    expect(comment).not_to be_valid
  end

  it "is invalid with long author name" do
    comment = FactoryGirl.build(:comment, body: "OLOLO" * 30)
    expect(comment).not_to be_valid
  end
end