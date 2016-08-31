module MenuHelper

  def login_link
    'login'
  end

  def logged_user
    if current_user
      %Q|<li class="login-name navbar-text">#{current_user}</li>
         <li class="logout-link">#{link_to 'LOGOUT', logout_path}</li>|
    else
      %Q|<li>#{login_link}</li>|
    end.html_safe
  end

  def dropdown_menu(title, &block)
    raw %Q|<li class="dropdown">
      <a href="#" class="dropdown-toggle" data-toggle="dropdown">#{title} <b class="caret"></b></a>
      <ul class="dropdown-menu">| + 
      capture(&block) + %Q|
      </ul>
      </li>|
  end

end

