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
      flash[:notice].should == "An activation email has been sent" 
      response.should redirect_to "/"
    end    
    
    it "should show the registration form when invalid params are given" do
      User.expects(:new).returns(@user)            
      @user.stubs(:save).returns(false)                          
      do_post(@valid_user_params) 
      response.should render_template "users/new"      
    end      
    
  end  
         
  
  describe "GET activate" do 
    def do_get(params)
      get :activate , :activation_code => params
    end                                       
  
    it "should activate user accounts when a valid activation code is given" do  
      @user = User.new(:email => "lol@lol.lol", :password => "lol", :password_confirmation => "lol")
      @user.stubs(:id).returns("1")
      User.expects(:find_by_activation_code).with(@user.activation_code).returns(@user)
      @user.expects(:activate!)            
      do_get(@user.activation_code)      
      flash[:notice].should == "Your account has been activated."
      response.should redirect_to user_path("1")     
    end 
                                                
    it "should redirect to root when an invalid activation code is given" do  
      User.expects(:find_by_activation_code)
      do_get("harbl")                   
      flash[:notice].should == "Activation code has not been foud."
      response.should redirect_to "/"     
    end
    
  end
        
end