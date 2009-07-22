require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClansController do
  describe "handling GET /clans" do

    before(:each) do
      @clan = mock_model(Clan)
      Clan.stub!(:find).and_return([@clan])
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
  
    it "should find all clans" do
      Clan.should_receive(:find).with(:all).and_return([@clan])
      do_get
    end
  
    it "should assign the found clans for the view" do
      do_get
      assigns[:clans].should == [@clan]
    end
  end

  describe "handling GET /clans/1" do

    before(:each) do
      @clan = mock_model(Clan)
      Clan.stub!(:find).and_return(@clan)
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
  
    it "should find the clan requested" do
      Clan.should_receive(:find).with("1").and_return(@clan)
      do_get
    end
  
    it "should assign the found clan for the view" do
      do_get
      assigns[:clan].should equal(@clan)
    end
  end

  describe "handling GET /clans/new" do

    before(:each) do
      @clan = mock_model(Clan)
      Clan.stub!(:new).and_return(@clan)
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
  
    it "should create an new clan" do
      Clan.should_receive(:new).and_return(@clan)
      do_get
    end
  
    it "should not save the new clan" do
      @clan.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new clan for the view" do
      do_get
      assigns[:clan].should equal(@clan)
    end
  end

  describe "handling GET /clans/1/edit" do

    before(:each) do
      @clan = mock_model(Clan)
      Clan.stub!(:find).and_return(@clan)
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
  
    it "should find the clan requested" do
      Clan.should_receive(:find).and_return(@clan)
      do_get
    end
  
    it "should assign the found Clans for the view" do
      do_get
      assigns[:clan].should equal(@clan)
    end
  end

  describe "handling POST /clans" do

    before(:each) do
      @clan = mock_model(Clan, :to_param => "1")
      Clan.stub!(:new).and_return(@clan)
    end
    
    describe "with successful save" do
  
      def do_post
        @clan.should_receive(:save).and_return(true)
        post :create, :clan => {}
      end
  
      it "should create a new clan" do
        Clan.should_receive(:new).with({}).and_return(@clan)
        do_post
      end

      it "should redirect to the new clan" do
        do_post
        response.should redirect_to(clan_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @clan.should_receive(:save).and_return(false)
        post :create, :clan => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /clans/1" do

    before(:each) do
      @clan = mock_model(Clan, :to_param => "1")
      Clan.stub!(:find).and_return(@clan)
    end
    
    describe "with successful update" do

      def do_put
        @clan.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the clan requested" do
        Clan.should_receive(:find).with("1").and_return(@clan)
        do_put
      end

      it "should update the found clan" do
        do_put
        assigns(:clan).should equal(@clan)
      end

      it "should assign the found clan for the view" do
        do_put
        assigns(:clan).should equal(@clan)
      end

      it "should redirect to the clan" do
        do_put
        response.should redirect_to(clan_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @clan.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /clans/1" do

    before(:each) do
      @clan = mock_model(Clan, :destroy => true)
      Clan.stub!(:find).and_return(@clan)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the clan requested" do
      Clan.should_receive(:find).with("1").and_return(@clan)
      do_delete
    end
  
    it "should call destroy on the found clan" do
      @clan.should_receive(:destroy).and_return(true) 
      do_delete
    end
  
    it "should redirect to the clans list" do
      do_delete
      response.should redirect_to(clans_url)
    end
  end
end
