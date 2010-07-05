require 'spec_helper'

describe Shouty do
  should_belong_to :user
  should_validate_presence_of :user, :body

  it 'should return newest shouties first' do
    Factory(:shouty)
    shouty = Factory(:shouty)
    Shouty.first.should == shouty
  end
end
