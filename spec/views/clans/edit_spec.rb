require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/clans/edit.html.erb" do
  include ClansHelper
  
  before do
    @clan = mock_model(Clan)
    @clan.stub!(:name).and_return("MyString")
    @clan.stub!(:description).and_return("MyText")
    assigns[:clan] = @clan

    template.should_receive(:object_url).twice.and_return(clan_path(@clan)) 
    template.should_receive(:collection_url).and_return(clans_path) 
  end

  it "should render edit form" do
    render "/clans/edit.html.erb"
    
    response.should have_tag("form[action=#{clan_path(@clan)}][method=post]") do
      with_tag('input#clan_name[name=?]', "clan[name]")
      with_tag('textarea#clan_description[name=?]', "clan[description]")
    end
  end
end


