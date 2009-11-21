class UserSessionsController < ApplicationController
  
  def new
    @user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save                   
      flash[:notice] = "Successfully logged in!"      
      redirect_to user_path(current_user)
    else
      flash[:error] = "Invalid user credentials"
      render :new
    end
    
  end
  
end
