require 'spec_helper'

describe User do
  before(:each) do
    @valid_attributes = {
      :login => "value for login",
      :email => "value for email",
      :crypted_password => "value for crypted_password",
      :password_salt => "value for password_salt",
      :persistence_token => "value for persistence_token",
      :single_access_token => "value for single_access_token",
      :perishable_token => "value for perishable_token"
    }
  end

  it "should create a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end
end
