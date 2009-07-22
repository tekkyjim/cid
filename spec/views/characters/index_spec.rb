require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/characters/index.html.erb" do
  include CharactersHelper
  
  before(:each) do
    character_98 = mock_model(Character)
    character_98.should_receive(:name).and_return("MyString")
    character_98.should_receive(:bio).and_return("MyString")
    character_98.should_receive(:user_id).and_return("1")
    character_99 = mock_model(Character)
    character_99.should_receive(:name).and_return("MyString")
    character_99.should_receive(:bio).and_return("MyString")
    character_99.should_receive(:user_id).and_return("1")

    assigns[:characters] = [character_98, character_99]

    template.stub!(:object_url).and_return(character_path(character_99))
    template.stub!(:new_object_url).and_return(new_character_path) 
    template.stub!(:edit_object_url).and_return(edit_character_path(character_99))
  end

  it "should render list of characters" do
    render "/characters/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyString", 2)
  end
end

