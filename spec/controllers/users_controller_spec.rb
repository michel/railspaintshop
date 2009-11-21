require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UsersController do
    
  describe "Handeling GET new" do
    
    def do_get      
      get :new
    end       

    it "should render the new template" do
      User.expects(:new)
      do_get
      response.should render_template "users/new"
    end
    
  end  
                      
  describe "Handeling POST create" do
    
    before(:each) do
      @valid_user_params = {:email => "test@test.nl", :password => "password", :password_confirmation => "password"}
      @invalid_user_params = {:email => "test@test.nl", :password => "password", :password_confirmation => ""}
      
      @user = User.new
      @user.stubs(:save).returns(true)                    
      @user.stubs(:id).returns(1)      
    end
    
    def do_post(params)
      post :create , :user => params
    end                                                          
      
    it "should redirect to the users page when valid params are given" do      
      User.expects(:new).returns(@user)
      do_post(@valid_user_params) 
      response.should redirect_to user_path("1")     
    end    
    
    it "should show the registration form when invalid params are given" do
      User.expects(:new).returns(@user)            
      @user.stubs(:save).returns(false)                          
      do_post(@valid_user_params) 
      response.should render_template "users/new"      
    end      
    
  end  
  

  
end