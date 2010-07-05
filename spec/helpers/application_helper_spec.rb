require 'spec_helper'

def msg
  "hello"
end

def null
end

describe ApplicationHelper do
  context "on #message" do
     it "should return a container with the given param as the class and the evaluated param as the content if not null" do
       message(:msg).should eql("<div class='msg'>#{msg}</div>")
     end

     it "should not return nothing if the evaluated param is null" do
       message(:null).should be_blank
     end
  end
end
