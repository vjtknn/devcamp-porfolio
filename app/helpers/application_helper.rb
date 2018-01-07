module ApplicationHelper
  def login_helper
    #Less Ruby solition, but also works fine
    # if current_user.class == User
    if current_user.is_a?(User)
      link_to "Logout", destroy_user_session_path, method: :delete
    else
      (link_to "Register", new_user_registration_path) +
      "<br>".html_safe +
      (link_to "Login", new_user_session_path)
    end
  end

  def sample_helper
    content_tag(:div, "My content", class: "my-nice-content")
  end

  def source_helper(layout_name)
    if session[:source]
      content_tag(:p, "Thanks for visiting me from #{session[:source]}
                       and you are on the #{layout_name}")
    end
  end
end
