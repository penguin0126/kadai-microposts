class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]

    if login(email, password)
      flash[:success] = 'ログインに成功しました'
      redirect_to @user
    else
      flash[:danger] = 'ログインに失敗しました。'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました'
    redirect_to root_url
  end

  def login(email, password)
    @email = User.find_by(email: email)

    if @email && @password.authenticate(password)
      session[:user_id] = @user.id
      return true
    else
      return
    end
  end
end
