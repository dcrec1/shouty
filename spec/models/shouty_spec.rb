require 'spec_helper'

describe Shouty do
  before(:each) do
    @valid_attributes = {
      :user_id => 1,
      :date => Time.now,
      :body => "value for body"
    }
  end

  it "should create a new instance given valid attributes" do
    Shouty.create!(@valid_attributes)
  end
end
