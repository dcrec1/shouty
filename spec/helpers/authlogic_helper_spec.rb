require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AuthlogicHelper do
  include AuthlogicHelper

  before :each do
    @user = mock(User)
    @user_session = mock(UserSession)
    @session = {}
    stub!(:session).and_return(@session)
  end

  it "deve validar que um usuário esta logado retornando nulo" do
    stub!(:current_user).and_return(@user)
    require_user.should be_nil
  end
  
  context "quando um usuário tentar acessar uma area restrita sem estar logado" do
    before :each do
      @uri = "fsdgsdgfs"
      request.stub!(:request_uri).and_return(@uri)
      stub!(:current_user).and_return(nil)
      stub!(:login_path)
      stub!(:redirect_to)
      session = Hash.new
    end
  
    it "deve retornar false" do
      require_user.should be_false
    end
  
    it "deve redirecionar para a pagina de login" do
      should_receive(:redirect_to).with(login_path)
      require_user
    end
    
    it "deve guardar a uri atual na sessão com a key return_to" do
      require_user
      session[:return_to].should eql(@uri)
    end
  end
  
  it "deve devolver a sessão atual" do
    UserSession.stub(:find).and_return(@user_session)
    current_user_session.should eql(@user_session)
  end
  
  it "deve cachear a sessão se não for nula" do
    UserSession.stub(:find).and_return(@user_session)
    current_user_session
    UserSession.stub(:find).and_return(nil)
    current_user_session.should eql(@user_session)
  end
  
  it "deve cachear a sessão se for nula" do
    UserSession.stub(:find).and_return(nil)
    current_user_session
    UserSession.stub(:find).and_return(@user_session)
    current_user_session.should be_nil
  end
  
  it "deve devolver um usuario se a sessão existir" do
    @user_session.stub!(:record).and_return(@user)
    stub!(:current_user_session).and_return(@user_session)
    current_user.should eql(@user)
  end
  
  it "deve devolver nil se a sessão não existir" do
    stub!(:current_user_session).and_return(nil)
    current_user.should be_nil
  end
  
  it "deve cachear o usuário se não for nulo" do
    @user_session.stub!(:record).and_return(@user)
    stub!(:current_user_session).and_return(@user_session)
    current_user
    stub!(:current_user_session).and_return(nil)
    current_user.should eql(@user)
  end
  
  it "deve cachear o usuário for nulo" do
    stub!(:current_user_session).and_return(nil)
    current_user
    @user_session.stub!(:record).and_return(@user)
    stub!(:current_user_session).and_return(@user_session)
    current_user.should be_nil
  end
  
  it "deve redirecionar para o return_to gravado na sessão" do
    uri = "fdasfasnwejnf"
    @session[:return_to] = uri
    self.should_receive(:redirect_to).with(uri)
    redirect_back_or_default("fsfs")
  end
  
  it "deve redirecionar para uma uri passada como parámetro caso não exista uma na sessão" do
    uri = "fwfwewe"
    should_receive(:redirect_to).with(uri)
    redirect_back_or_default(uri)
  end
  
  it "deve apagar a uri da sessão após um redirecionamento" do
    uri = "fwfwewe"
    @session[:return_to] = uri
    stub!(:redirect_to)
    redirect_back_or_default(uri)
    @session[:redirect_to].should be_nil
  end
end