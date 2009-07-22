require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe CharactersController do
  describe "route generation" do

    it "should map { :controller => 'characters', :action => 'index' } to /characters" do
      route_for(:controller => "characters", :action => "index").should == "/characters"
    end
  
    it "should map { :controller => 'characters', :action => 'new' } to /characters/new" do
      route_for(:controller => "characters", :action => "new").should == "/characters/new"
    end
  
    it "should map { :controller => 'characters', :action => 'show', :id => '1'} to /characters/1" do
      route_for(:controller => "characters", :action => "show", :id => "1").should == "/characters/1"
    end
  
    it "should map { :controller => 'characters', :action => 'edit', :id => '1' } to /characters/1/edit" do
      route_for(:controller => "characters", :action => "edit", :id => "1").should == "/characters/1/edit"
    end
  
    it "should map { :controller => 'characters', :action => 'update', :id => '1' } to /characters/1" do
      route_for(:controller => "characters", :action => "update", :id => "1").should == {:path => "/characters/1", :method => :put}
    end
  
    it "should map { :controller => 'characters', :action => 'destroy', :id => '1' } to /characters/1" do
      route_for(:controller => "characters", :action => "destroy", :id => "1").should == {:path => "/characters/1", :method => :delete}
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'characters', action => 'index' } from GET /characters" do
      params_from(:get, "/characters").should == {:controller => "characters", :action => "index"}
    end
  
    it "should generate params { :controller => 'characters', action => 'new' } from GET /characters/new" do
      params_from(:get, "/characters/new").should == {:controller => "characters", :action => "new"}
    end
  
    it "should generate params { :controller => 'characters', action => 'create' } from POST /characters" do
      params_from(:post, "/characters").should == {:controller => "characters", :action => "create"}
    end
  
    it "should generate params { :controller => 'characters', action => 'show', id => '1' } from GET /characters/1" do
      params_from(:get, "/characters/1").should == {:controller => "characters", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'characters', action => 'edit', id => '1' } from GET /characters/1;edit" do
      params_from(:get, "/characters/1/edit").should == {:controller => "characters", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'characters', action => 'update', id => '1' } from PUT /characters/1" do
      params_from(:put, "/characters/1").should == {:controller => "characters", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'characters', action => 'destroy', id => '1' } from DELETE /characters/1" do
      params_from(:delete, "/characters/1").should == {:controller => "characters", :action => "destroy", :id => "1"}
    end
  end
end
