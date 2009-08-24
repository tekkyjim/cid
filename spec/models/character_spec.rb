require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Character do
  before(:each) do
    @character = Factory.build(:valid_character)
  end

  it "should be valid" do
    @character.should be_valid  
  end
  it "should be invalid" do
    Factory.build(:invalid_character).should be_invalid
  end
end



