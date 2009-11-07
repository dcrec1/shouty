class ShoutiesController < InheritedResources::Base
  respond_to :html, :json, :xml
  
  before_filter :require_user
  before_filter :assign_user, :only => [:create]
  
  def index
    @shouty = Shouty.new
    index!
  end
  
  def fetch
    render :partial => "shared/shouty", :collection => Shouty.paginate(:page => 1)
  end
  
  protected
  
  def collection
    @shouties ||= end_of_association_chain.paginate(:page => params[:page])
  end
  
  private
  
  def assign_user
    params[:shouty].merge! :user => current_user
  end
end