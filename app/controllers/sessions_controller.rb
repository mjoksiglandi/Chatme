class SessionsController < ApplicationController

  def new
  end

  def create
    #byebug
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "estas logeado"
      redirect_to root_path
      #
    else
      flash.now[:error] = "algo ha salido mal"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "te has desconectado"
    redirect_to login_path
  end

end
