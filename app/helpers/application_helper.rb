module ApplicationHelper
  def login_helper(_style = "")
    if !user_signed_in?
      link_to("Register", new_user_registration_path, class: "navbar-item") +
        " ".html_safe +
        link_to("Login", new_user_session_path, class: "navbar-item")
    else
      link_to(
        "Logout",
        destroy_user_session_path,
        data: { turbo_method: :delete },
        class: "navbar-item"
      )
    end
  end

  def active?(path)
    "active" if current_page? path
  end

  def flash_class(level)
    case level.to_sym
    when :notice  then "bg-primary"
    when :success then "bg-success"
    when :alert   then "bg-warning"
    when :error   then "bg-danger"
    else "bg-info"
    end
  end

  def avatar_helper(user)
    profile_image =
      if user.profile.file.nil?
        "https://gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email.downcase)}"
      else
        member.profile.to_s
      end

    image_tag(profile_image, width: 40, height: 40, style: "border-radius: 50%")
  end
end
