require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Clan do
  before(:each) do
    @clan = Clan.new
  end

  it "should be valid" do
    @clan.should be_valid
  end
end
