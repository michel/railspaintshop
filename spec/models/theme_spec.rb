require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Theme do    
  
  before(:each) do
    @theme = Theme.create(:name => "nice theme",
                          :repo => "git://redrocket.com:nice_theme.git",
                          :description => "this is a pretty nice theme eeahh")    
  end
  
  it { should belong_to(:user) }
  it { should have_column(:name, :type => :string) }    
  it { should have_column(:description, :type => :text) }  
  it { should have_column(:repo, :type => :string) } 
  it { should have_index(:user_id) }       
  it { should validate_presence_of(:name) }       
  it { should validate_presence_of(:repo) }
  it { should validate_uniqueness_of(:name) }
  
     
end