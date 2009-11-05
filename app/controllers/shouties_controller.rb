class ShoutiesController < InheritedResources::Base
  respond_to :html, :json, :xml
  
  before_filter :require_user
  before_filter :assign_user, :only => [:create]
  
  def index
    @shouty = Shouty.new
    index!
  end
  
  private
  
  #def collection
  #  @shouties ||= end_of_association_chain.paginate(params[:page]).all
  #end
  
  def assign_user
    params[:shouty].merge! :user => current_user
  end
end