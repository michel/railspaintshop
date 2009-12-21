require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserSessionsController do     
  

  

  describe "Handeling GET new" do    
    #user_sessions/new
    def do_get
      get :new 
    end
    
    
    it "should create a new UserSession" do
      user_session = mock("UserSession")
      UserSession.expects(:new).returns(user_session)
      do_get
      assigns(:user_session).should == user_session 
    end 
    

    
  end 
  
       
  describe "Handeling DELETE requests" do
    
    before(:each) do
      @current_user_session = mock("current_user_session")                                    
      @current_user_session.expects(:destroy)              
      controller.expects(:current_user_session).returns(@current_user_session)                
    end                                                   
    
    def do_delete                              
      delete :destroy
    end              
    
    it "should destroy the current_user_session" do
        do_delete
    end          
    
    it "should set the flash" do
      do_delete      
      flash[:notice].should == "Logout successfull!"
    end  
    
    it "should redirect to the login page" do
       do_delete
       controller.should redirect_to(new_user_session_path)                  
    end
    
  end

  describe "Handeling POST create" do

    def do_post
      post :create , :user_session => { :email => "michel@re-invention.nl", :password => "password" }
    end    
    
    it "should create a new user_session with the given params" do
        @user_session = stub_everything("UserSession")                  
        UserSession.expects(:new).returns(@user_session)    
        do_post      
    end   
    
    it "should redirect to the user_page when the given params are valid" do 
        @user_session = mock("UserSession", :priority_record= => nil, :persisting? => true, :record => "1")                                
        @user_session.expects(:save).returns(true)  
        @user_session.stubs(:find).returns(1)
        UserSession.stubs(:new).returns(@user_session) 
        do_post
        response.should redirect_to(user_path(1))            
    end
    
   
   it "should render the index page when the given user credentials are invalid" do  
       @user_session =  mock("UserSession", :save => false)
       UserSession.expects(:new).returns(@user_session) 
       do_post
       response.should render_template("user_sessions/new")      
       flash[:error].should == "Invalid user credentials"
   end 
       
                                    
  
  end
  
end