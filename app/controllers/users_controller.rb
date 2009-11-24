class UsersController < InheritedResources::Base  
  actions :show, :new  
  respond_to :html
  
  def create
     @user = User.new(params[:user])
     if @user.save
       flash[:notice] = "An activation email has been sent" 
       redirect_to "/"        
     else
       render :new
     end          
  end 
  
  
  def activate
    @user = User.find_by_activation_code(params[:activation_code])
    if @user
      @user.activate!
      flash[:notice] = "Your account has been activated."
      redirect_to user_path(@user)         
    else             
      flash[:notice] = "Activation code has not been foud."
      redirect_to  "/"     
    end
  end
 
        
end