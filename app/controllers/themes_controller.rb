class ThemesController < ApplicationController
  
  def index
    render :text => flash[:notice]
  end
  
  
end
