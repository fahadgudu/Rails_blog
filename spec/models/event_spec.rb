require 'rails_helper'

RSpec.describe Event, type: :model do
  it "is valid with a title, content, author and starting time" do
    expect(FactoryGirl.build(:event)).to be_valid
  end

  it "is invalid without a title" do
    event = FactoryGirl.build(:event, title: nil)
    expect(event).not_to be_valid
  end

  it "is invalid without a content" do
    event = FactoryGirl.build(:event, body: nil)
    expect(event).not_to be_valid
  end

  it "is invalid without an author name" do
    event = FactoryGirl.build(:event, author: nil)
    expect(event).not_to be_valid
  end

  it "is invalid with long title" do
    event = FactoryGirl.build(:event, title: "Ski bi di bi di do bap do 
                                              Do bam do 
                                              Bada bwi ba ba bada bo 
                                              Baba ba da bo 
                                              Bwi ba ba ba do
                                              I'm a scatman" * 3)
    expect(event).not_to be_valid
  end

  it "is invalid with unapropriate date length" do
    event = FactoryGirl.build(:event, start_time: "Just do it!" * 7)
    expect(event).not_to be_valid
  end
end