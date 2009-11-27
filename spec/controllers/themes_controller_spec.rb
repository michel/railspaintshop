require File.expand_path(File.join(File.dirname(__FILE__),'..','spec_helper'))

describe ThemesController do
  

  describe "GET index" do 

    def do_get
      get :index
    end
    
    it "should show the flash notice" do
      flash[:notice] = "test"
      do_get
      response.body.should =~ /#{flash[:notice]}/      
    end
    
  end
  
end
