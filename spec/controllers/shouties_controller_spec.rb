require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShoutiesController do
  should_have_before_filter :require_user
  
  context "with the user logged" do
    before :each do 
      login_user 
    end
    
    should_behave_like_resource :formats => [:html, :xml, :json], :paginate => true
    
    it "respoding to GET return the first page of shouties" do
      Shouty.stub!(:paginate).with(:page => 1).and_return(shouties = [Shouty.new, Shouty.new])
      controller.should_receive(:render).with(:partial => "shared/shouty", :collection => shouties)
      get :fetch
    end
  end
end