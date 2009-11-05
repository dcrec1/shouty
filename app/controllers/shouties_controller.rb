class ShoutiesController < InheritedResources::Base
  respond_to :html, :json, :xml
  
  before_filter :require_user
  
  def index
    @shouty = Shouty.new
    index!
  end
end