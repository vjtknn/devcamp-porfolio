module ApplicationHelper
  def login_helper(*style)
    #Less Ruby solition, but also works fine
    # if current_user.class == User
    unless current_user.is_a?(GuestUser)
      link_to "Logout", destroy_user_session_path, method: :delete, class: style
    else
      (link_to "Register", new_user_registration_path, class: style) +
      " ".html_safe +
      (link_to "Login", new_user_session_path, class: style)
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

  def copyright name, msg
    "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
  end

  def nav_items
    [
      {
        url: root_path,
        title: 'Home',
      },
      {
        url: about_me_path,
        title: 'About',
      },
      {
        url: contact_path,
        title: 'Contact',
      },
      {
        url: posts_path,
        title: 'Blog',
      },
      {
        url: portfolios_path,
        title: 'Portfolio',
      },
      {
        url: tech_news_path,
        title: 'Tech news'
      }

    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end
# nav_links = <<NAV
# <#{tag_type}><a href="#{about_me_path}" class="#{style} #{active? about_me_path}">About</a></#{tag_type}>
# <#{tag_type}><a href="#{contact_path}" class="#{style} #{active? contact_path}">Contact</a></#{tag_type}>
# <#{tag_type}><a href="#{posts_path}" class="#{style} #{active? posts_path}">Blog</a></#{tag_type}>
# <#{tag_type}><a href="#{portfolios_path}" class="#{style} #{active? portfolios_path}">Portfolio</a></#{tag_type}>
# NAV
    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator(alert)
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: "Wojciech Winnicki Portfolio", sticky: false)

  end
end
