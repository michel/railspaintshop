require File.expand_path(File.join(File.dirname(__FILE__),'..','spec_helper'))

describe ThemesController do
  

  describe "GET index" do 

    def do_get(params=nil)
      get :index , params
    end
  
    it "should list all the avalible themes on page 1" do
      @themes =  (1..10).collect { Factory.create :theme }
      Theme.expects(:search).returns(@themes)
      do_get :page => 1                 
      assigns[:themes].size.should be(@themes.size)      
    end
  
  end
  
end
