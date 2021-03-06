require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CharactersController do
  describe "Authenticated examples" do
    before(:each) do
      activate_authlogic
      UserSession.create Factory.build(:user)
  end
  describe "handling GET /characters" do

    before(:each) do
      @character = mock_model(Character)
      Character.stub!(:find).and_return([@character])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all characters" do
      Character.should_receive(:find).with(:all).and_return([@character])
      do_get
    end
  
    it "should assign the found characters for the view" do
      do_get
      assigns[:characters].should == [@character]
    end
  end

  describe "handling GET /characters/1" do

    before(:each) do
      @character = mock_model(Character)
      Character.stub!(:find).and_return(@character)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the character requested" do
      Character.should_receive(:find).with("1").and_return(@character)
      do_get
    end
  
    it "should assign the found character for the view" do
      do_get
      assigns[:character].should equal(@character)
    end
  end

  describe "handling GET /characters/new" do

    before(:each) do
      @character = mock_model(Character)
      Character.stub!(:new).and_return(@character)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new character" do
      Character.should_receive(:new).and_return(@character)
      do_get
    end
  
    it "should not save the new character" do
      @character.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new character for the view" do
      do_get
      assigns[:character].should equal(@character)
    end
  end

  describe "handling GET /characters/1/edit" do

    before(:each) do
      @character = mock_model(Character)
      Character.stub!(:find).and_return(@character)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the character requested" do
      Character.should_receive(:find).and_return(@character)
      do_get
    end
  
    it "should assign the found Characters for the view" do
      do_get
      assigns[:character].should equal(@character)
    end
  end

  describe "handling POST /characters" do

    before(:each) do
      @character = mock_model(Character, :to_param => "1")
      Character.stub!(:new).and_return(@character)
    end
    
    describe "with successful save" do
  
      def do_post
        @character.should_receive(:save).and_return(true)
        post :create, :character => {}
      end
  
      it "should create a new character" do
        Character.should_receive(:new).with({}).and_return(@character)
        do_post
      end

      it "should redirect to the new character" do
        do_post
        response.should redirect_to(character_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @character.should_receive(:save).and_return(false)
        post :create, :character => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /characters/1" do

    before(:each) do
      @character = mock_model(Character, :to_param => "1")
      Character.stub!(:find).and_return(@character)
    end
    
    describe "with successful update" do

      def do_put
        @character.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the character requested" do
        Character.should_receive(:find).with("1").and_return(@character)
        do_put
      end

      it "should update the found character" do
        do_put
        assigns(:character).should equal(@character)
      end

      it "should assign the found character for the view" do
        do_put
        assigns(:character).should equal(@character)
      end

      it "should redirect to the character" do
        do_put
        response.should redirect_to(character_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @character.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /characters/1" do

    before(:each) do
      @character = mock_model(Character, :destroy => true)
      Character.stub!(:find).and_return(@character)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the character requested" do
      Character.should_receive(:find).with("1").and_return(@character)
      do_delete
    end
  
    it "should call destroy on the found character" do
      @character.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the characters list" do
      do_delete
      response.should redirect_to(characters_url)
    end
  end
    end
  describe "should be authenticated" do
    it "should fail if we are not authenticated" do
      get :index
      response.should_not be_success
    end
  end
end
