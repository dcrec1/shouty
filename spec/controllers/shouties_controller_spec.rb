require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe ShoutiesController do
  should_have_before_filter :require_user
  
  context "with the user logged" do
    before :each do login_user end
    should_behave_like_resource :formats => [:html, :xml, :json]
  end
end