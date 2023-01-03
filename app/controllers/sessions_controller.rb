class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Logado com sucesso."
      redirect_to root_url
    else
      flash[:alert] = "Usuário ou senha inválidos."
      # render :new
      redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:notice] = "Sessão terminada com sucesso."
    redirect_to root_url
  end

end
