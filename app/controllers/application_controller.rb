class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  private

  def require_user_loggind_in?
    unless logged_in?
      redirect_to login_url
    end
  end

  def count(user)
    @count_micropost = user.microposts.count
  end
end
