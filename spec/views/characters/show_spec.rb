require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/characters/show.html.erb" do
  include CharactersHelper
  
  before(:each) do
    @character = mock_model(Character)
    @character.stub!(:name).and_return("MyString")
    @character.stub!(:bio).and_return("MyString")
    @character.stub!(:user_id).and_return("1")

    assigns[:character] = @character

    template.stub!(:edit_object_url).and_return(edit_character_path(@character)) 
    template.stub!(:collection_url).and_return(characters_path) 
  end

  it "should render attributes in <p>" do
    render "/characters/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyString/)
  end
end

