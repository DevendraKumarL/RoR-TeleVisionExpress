class WelcomeController < ApplicationController

  protect_from_forgery

  def register
  	@user = User.new
  end

  def create_user
  	if params[:password] == params[:password2]
      @check_email = User.find_by_email(params[:email])
      if @check_email
       flash[:notice] = "Email is already taken"
       render :controller => 'welcome' , :action => 'register', :notice => "Email is already taken!"
      else
        @user = User.new(user_params)
        if @user.save
          # flash[:notice] = "Registered successfully"
          redirect_to :controller => 'session', :action => 'log_user', :notice => "Registered"
        else
          flash[:notice] = "Email invalid"
          render :action => 'register', :notice => "Email invalid!"
        end
      end
      else
        flash[:notice] = "Passwords do not match"
        render :controller => 'welcome' , :action => 'register', :notice => "Passwords do not match!"
      end
  end

  private
  	def user_params
  		params.permit(:username, :email, :password)
  	end
end
