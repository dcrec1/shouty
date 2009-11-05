require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSessionsController do
  mock_models :user_session

  describe :get => :new do
    expects :new, :on => UserSession, :returns => mock_user_session
    should_assign_to :user_session, :with => mock_user_session
  end
  
  params = { 'login' => "joao", 'password' => "abc123", 'password_confirmation' => "abc123" }
  describe :post => :create, :user_session => params do
    expects :new, :on => UserSession, :with => params, :returns => mock_user_session
    expects :save, :on => mock_user_session, :returns => false
    
    should_assign_to :user_session, :with => mock_user_session
    should_render_template :new
  end
  
  context "respondendo para POST create após logar o usuário" do 
    before :each do
      UserSession.stub(:new).and_return(mock_user_session)
      mock_user_session.stub(:save).and_return(true)
      controller.stub!(:render)
      @msg = "rqwfwefwegfw"
      I18n.stub(:t).with(:login_successful).and_return(@msg)
    end
  
    it "deve enviar ele para a última pagina se existir ou a home" do
      controller.should_receive(:redirect_back_or_default).with(root_path)
      post :create
    end
    
    it "deve avisar que o usuario foi corretamente logado" do
      controller.stub(:redirect_back_or_default)
      post :create
      flash[:notice].should eql(@msg)
    end 
  end
  
  context "respondendo para DELETE destroy" do 
    before :each do
      @user_session = mock(UserSession, :destroy => nil)
      controller.stub(:current_user_session).and_return(@user_session)
      controller.stub(:render)
      controller.stub(:redirect_back_or_default)
      @msg = "rqwfwefwegfw"
      I18n.stub(:t).with(:logout_successful).and_return(@msg)
    end
  
    it "deve destruir a sessão atual" do
      @user_session.should_receive(:destroy)
      delete :destroy
    end
    
    it "deve enviar o usuário para a última pagina se existir ou a raiz" do
      controller.should_receive(:redirect_back_or_default).with(root_path)
      delete :destroy
    end
    
    it "deve avisar que o usuario foi corretamente delogado" do
      delete :destroy
      flash[:notice].should eql(@msg)
    end
  end
end