class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # Loga automaticamente o usuário
      session[:user_id] = @user.id
      flash[:notice] = "Logado com sucesso."
      redirect_to root_url
    else
      # render "new"
      render :new, status: :unprocessable_entity, content_type: "text/html"
    end
  end

  def index
    @users = User.all
  end


  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end
