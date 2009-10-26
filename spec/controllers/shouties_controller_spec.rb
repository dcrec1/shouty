require 'spec_helper'

describe ShoutiesController do
  should_behave_like_resource :formats => [:html, :xml, :json]
end