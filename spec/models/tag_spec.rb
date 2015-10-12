# == Schema Information
#
# Table name: tags
#
#  id   :integer          not null, primary key
#  name :string
#  slug :string
#

require 'rails_helper'

RSpec.describe Tag, type: :model do
  it "is valid with a title, text and author" do
    expect(FactoryGirl.build(:tag)).to be_valid
  end

  it "is invalid without a name" do
    expect(FactoryGirl.build(:invalid_tag)).not_to be_valid
  end

  it "is invalid without a slug" do
    tag = FactoryGirl.build(:tag, slug: nil)
    expect(tag).not_to be_valid
  end

  let(:tag) { FactoryGirl.build(:tag) }    

it "has a unique title" do
  older_product = FactoryGirl.create(:tag)
  tag.slug = older_product.slug
  expect(tag).not_to be_valid
end

end
