module ApplicationHelper
  def navigation_items
    if logged_in?
      display = current_user.username
      display += ' (Admin)' if current_user.admin?
      [
        link_to('Logout', logout_path, method: :delete),
        link_to(display, current_user)
      ]
    else
      [link_to('Login', login_path), link_to('Sign Up', signup_path)]
    end
  end
end
