require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clans/show.html.erb" do
  include ClansHelper
  
  before(:each) do
    @clan = mock_model(Clan)
    @clan.stub!(:name).and_return("MyString")
    @clan.stub!(:description).and_return("MyText")

    assigns[:clan] = @clan

    template.stub!(:edit_object_url).and_return(edit_clan_path(@clan)) 
    template.stub!(:collection_url).and_return(clans_path) 
  end

  it "should render attributes in <p>" do
    render "/clans/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

