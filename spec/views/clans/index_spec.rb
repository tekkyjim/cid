require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clans/index.html.erb" do
  include ClansHelper
  
  before(:each) do
    clan_98 = mock_model(Clan)
    clan_98.should_receive(:name).and_return("MyString")
    clan_98.should_receive(:description).and_return("MyText")
    clan_99 = mock_model(Clan)
    clan_99.should_receive(:name).and_return("MyString")
    clan_99.should_receive(:description).and_return("MyText")

    assigns[:clans] = [clan_98, clan_99]

    template.stub!(:object_url).and_return(clan_path(clan_99))
    template.stub!(:new_object_url).and_return(new_clan_path) 
    template.stub!(:edit_object_url).and_return(edit_clan_path(clan_99))
  end

  it "should render list of clans" do
    render "/clans/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

