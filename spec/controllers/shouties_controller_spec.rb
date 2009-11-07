require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShoutiesController do
  should_have_before_filter :require_user
  
  context "with the user logged" do
    before :each do 
      login_user 
    end
    
    should_behave_like_resource :formats => [:html, :xml, :json]
    
    it "respoding to GET fetch should assign to @shouties the first page of shouties" do
      Shouty.stub!(:paginate).with(:page => 1).and_return(shouties = [Shouty.new, Shouty.new])
      get :fetch
      assigns[:shouties].should eql(shouties)
    end
  end
end