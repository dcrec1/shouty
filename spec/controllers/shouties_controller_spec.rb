require 'spec_helper'

describe ShoutiesController do
  include Devise::TestHelpers
  render_views
  
  it "should require authentication" do
    get :index
    response.should redirect_to(new_user_session_path)
  end

  context "with a logger user" do
    before :all do
      31.times.map { Factory(:shouty) }
    end

    before :each do
      sign_in @user = Factory(:user)
    end

    context "responding to POST #create" do
      it "should create a shouty for the logged user" do
        post :create, :shouty => { :body => "hello!" }
        Shouty.first.user.should == @user
      end
    end

    context "responding to GET #index" do
      it "assigns a new Shouty as @shouty" do
        get :index
        assigns(:shouty).should be_new_record
      end

      it "should assign the specified page of shouties as @shouties" do
        get :index, :page => 2      
        assigns(:shouties).should == [Shouty.last]
      end
    end

    context "responding to GET #fetch" do
      it "assigns to @shouties the first page of shouties" do
        get :fetch, :format => :js
        assigns(:shouties).should eql(Shouty.paginate(:page => 1))
      end
    end
  end
end
