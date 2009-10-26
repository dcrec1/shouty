require File.join(File.dirname(__FILE__), "spec_helper.rb")

require 'authlogic'

create_table "users" do end
create_table "categories" do end

class Category < ActiveRecord::Base
end
  
class User < ActiveRecord::Base
  acts_as_authentic
end

describe Remarkable::Authlogic do
  describe "be_authentic" do  
    it "should acts as authentic" do
      be_authentic.matches?(User.new).should be_true
    end
    
    it "should not acts as authentic" do
      be_authentic.matches?(Category.new).should be_false
    end
  end
end