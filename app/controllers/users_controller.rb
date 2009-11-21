class UsersController < InheritedResources::Base  
  actions :show, :new  
  respond_to :html
  
  def create
     @user = User.new(params[:user])
     if @user.save
       flash[:notice] = "Successfully signed up!" 
       redirect_to user_path(@user)         
     else
       render :new
     end          
  end
 
        
end