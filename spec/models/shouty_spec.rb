require 'spec_helper'

describe Shouty do
  should_belong_to :user
  should_validate_presence_of :user, :body
end