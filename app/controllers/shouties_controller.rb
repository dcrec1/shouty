class ShoutiesController < InheritedResources::Base
  respond_to :html, :json, :xml
  
  def index
    @shouty = Shouty.new
    index!
  end
end