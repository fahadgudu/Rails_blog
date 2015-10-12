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

require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with a username, content, author and starting time" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

  it "is invalid without a name" do
    user = FactoryGirl.build(:user, username: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without a surname" do
    user = FactoryGirl.build(:user, surname: nil)
    expect(user).not_to be_valid
  end

  it "is invalid without an age" do
    user = FactoryGirl.build(:user, age: nil)
    expect(user).not_to be_valid
  end

  it "is invalid with long username" do
    user = FactoryGirl.build(:user, username: "Ski bi di bi di do bap do 
                                              Do bam do 
                                              Bada bwi ba ba bada bo 
                                              Baba ba da bo 
                                              Bwi ba ba ba do
                                              I'm a scatman" * 5)
    expect(user).not_to be_valid
  end

  it "is invalid with letters in age" do
    user = FactoryGirl.build(:invalid_user)
    expect(user).not_to be_valid
  end

  it "is invalid with unapropriate surname length" do
    user = FactoryGirl.build(:user, surname: "Just do it! Yesterday you say tommorow." * 7)
    expect(user).not_to be_valid
  end
end
