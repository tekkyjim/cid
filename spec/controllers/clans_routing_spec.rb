require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ClansController do
  describe "route generation" do

    it "should map { :controller => 'clans', :action => 'index' } to /clans" do
      route_for(:controller => "clans", :action => "index").should == "/clans"
    end
  
    it "should map { :controller => 'clans', :action => 'new' } to /clans/new" do
      route_for(:controller => "clans", :action => "new").should == "/clans/new"
    end
  
    it "should map { :controller => 'clans', :action => 'show', :id => '1'} to /clans/1" do
      route_for(:controller => "clans", :action => "show", :id => "1").should == "/clans/1"
    end
  
    it "should map { :controller => 'clans', :action => 'edit', :id => '1' } to /clans/1/edit" do
      route_for(:controller => "clans", :action => "edit", :id => "1").should == "/clans/1/edit"
    end
  
    it "should map { :controller => 'clans', :action => 'update', :id => '1' } to /clans/1" do
      route_for(:controller => "clans", :action => "update", :id => "1").should == {:path => "/clans/1", :method => :put}
    end
  
    it "should map { :controller => 'clans', :action => 'destroy', :id => '1' } to /clans/1" do
      route_for(:controller => "clans", :action => "destroy", :id => "1").should == {:path => "/clans/1", :method => :delete}
    end
  end

  describe "route recognition" do

    it "should generate params { :controller => 'clans', action => 'index' } from GET /clans" do
      params_from(:get, "/clans").should == {:controller => "clans", :action => "index"}
    end
  
    it "should generate params { :controller => 'clans', action => 'new' } from GET /clans/new" do
      params_from(:get, "/clans/new").should == {:controller => "clans", :action => "new"}
    end
  
    it "should generate params { :controller => 'clans', action => 'create' } from POST /clans" do
      params_from(:post, "/clans").should == {:controller => "clans", :action => "create"}
    end
  
    it "should generate params { :controller => 'clans', action => 'show', id => '1' } from GET /clans/1" do
      params_from(:get, "/clans/1").should == {:controller => "clans", :action => "show", :id => "1"}
    end
  
    it "should generate params { :controller => 'clans', action => 'edit', id => '1' } from GET /clans/1;edit" do
      params_from(:get, "/clans/1/edit").should == {:controller => "clans", :action => "edit", :id => "1"}
    end
  
    it "should generate params { :controller => 'clans', action => 'update', id => '1' } from PUT /clans/1" do
      params_from(:put, "/clans/1").should == {:controller => "clans", :action => "update", :id => "1"}
    end
  
    it "should generate params { :controller => 'clans', action => 'destroy', id => '1' } from DELETE /clans/1" do
      params_from(:delete, "/clans/1").should == {:controller => "clans", :action => "destroy", :id => "1"}
    end
  end
end
