require 'spec_helper'

describe User do
  should_validate_presence_of :login
  should_validate_uniqueness_of :login
  
  it "should accept a login" do
    subject.class.new(:login => "dcrec1").login.should eql("dcrec1")
  end
end
