class SessionsController < ApplicationController
  
  def new
  end
  
  def destroy
    session[:user_id] = nil 
    redirect_to "localhost:3000/" #:controller =>'StaticPages' :action =>'about'
  end
  
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to @user
    else flash.now[:message] = 'Invalid email/password combination'
      render 'new'
    end
 end
  
end
