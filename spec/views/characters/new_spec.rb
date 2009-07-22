require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/characters/new.html.erb" do
  include CharactersHelper
  
  before(:each) do
    @character = mock_model(Character)
    @character.stub!(:new_record?).and_return(true)
    @character.stub!(:name).and_return("MyString")
    @character.stub!(:bio).and_return("MyString")
    @character.stub!(:user_id).and_return("1")
    assigns[:character] = @character


    template.stub!(:object_url).and_return(character_path(@character)) 
    template.stub!(:collection_url).and_return(characters_path) 
  end

  it "should render new form" do
    render "/characters/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", characters_path) do
      with_tag("input#character_name[name=?]", "character[name]")
      with_tag("input#character_bio[name=?]", "character[bio]")
    end
  end
end


