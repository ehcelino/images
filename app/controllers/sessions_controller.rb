class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:alert] = "Logado com sucesso."
      if params[:from_url]
        redirect_to params[:from_url]
      else
        redirect_to root_url
      end
    else
      flash[:alert] = "Usuário ou senha inválidos."
      # render :new
      redirect_to login_path
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:alert] = "Sessão terminada com sucesso."
    redirect_to request.referer
  end

end
