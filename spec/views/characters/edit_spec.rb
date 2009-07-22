require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/characters/edit.html.erb" do
  include CharactersHelper
  
  before do
    @character = mock_model(Character)
    @character.stub!(:name).and_return("MyString")
    @character.stub!(:bio).and_return("MyString")
    @character.stub!(:user_id).and_return("1")
    assigns[:character] = @character

    template.should_receive(:object_url).twice.and_return(character_path(@character)) 
    template.should_receive(:collection_url).and_return(characters_path) 
  end

  it "should render edit form" do
    render "/characters/edit.html.erb"
    
    response.should have_tag("form[action=#{character_path(@character)}][method=post]") do
      with_tag('input#character_name[name=?]', "character[name]")
      with_tag('input#character_bio[name=?]', "character[bio]")
    end
  end
end


