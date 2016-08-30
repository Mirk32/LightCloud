module SessionsHelper
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def avatar_get(user)
    if user
      user.cover_image
    else
      a = rand(1..3)
      "/assets/default-avatar-#{a}.png"
    end
  end
end
