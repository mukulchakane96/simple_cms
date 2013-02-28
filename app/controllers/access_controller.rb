class AccessController < ApplicationController
  
  layout 'admin'
  
  before_filter :confirm_logged_in, :except=>[:login, :attempt_login, :logout]
  
  def index
    menu
	render('menu')
  end
  
  def menu
    #display text and links
	
  end

  def login
    #log in
  end
  
  
  def attempt_login
    authorized_user= AdminUser.authenticate(params[:username],params[:password])
	if authorized_user
	 #TODO: mark user as logged in
	 
 	session[:user_id]=authorized_user.id
	session[:username]=authorized_user.username

	 
	 flash[:notice]="You are now logged in."
	 redirect_to(:action=>'menu')
	else
      flash[:notice]="Invalid username/password combination."
	  redirect_to(:action=>"login")
	
	end	
	
  end
  
  def logout
    
	#TODO: mark user as logged out
	session[:user_id]=nil
	session[:username]=nil
	
	flash[:notice]="You have been logged out. We count on you to promote peace and justice! Hope you can come back! "
	redirect_to(:action=>"login")
	
  end
  
  
  
  
end