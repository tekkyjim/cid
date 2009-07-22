require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clans/new.html.erb" do
  include ClansHelper
  
  before(:each) do
    @clan = mock_model(Clan)
    @clan.stub!(:new_record?).and_return(true)
    @clan.stub!(:name).and_return("MyString")
    @clan.stub!(:description).and_return("MyText")
    assigns[:clan] = @clan


    template.stub!(:object_url).and_return(clan_path(@clan)) 
    template.stub!(:collection_url).and_return(clans_path) 
  end

  it "should render new form" do
    render "/clans/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", clans_path) do
      with_tag("input#clan_name[name=?]", "clan[name]")
      with_tag("textarea#clan_description[name=?]", "clan[description]")
    end
  end
end


