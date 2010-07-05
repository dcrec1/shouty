class ShoutiesController < InheritedResources::Base
  before_filter :authenticate_user!
  before_filter :assign_user, :only => [:create]

  respond_to :html, :js
  
  def index
    @shouty = Shouty.new
    index!
  end
  
  def fetch
    collection
  end
  
  protected
  
  def collection
    @shouties ||= end_of_association_chain.paginate(:page => params[:page])
  end
  
  private
  
  def assign_user
    params[:shouty][:user] = current_user
  end
end
