module AuthlogicHelper
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    session = current_user_session
    @current_user = session && session.record
  end
  
  def require_user
    unless current_user
      store_location
      redirect_to login_path
      return false
    end
  end
  
  def store_location
    session[:return_to] = request.request_uri
  end
  
  def redirect_back_or_default(default)
    redirect_to(session.delete(:return_to) || default)
  end
end