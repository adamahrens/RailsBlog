module ApplicationHelper
  def navigation_items
    if logged_in?
      [
        link_to('Logout', logout_path, method: :delete),
        link_to(current_user.username, current_user)
      ]
    else
      [
        link_to('Login', login_path),
        link_to('Sign Up', signup_path)
      ]
    end
  end
end
