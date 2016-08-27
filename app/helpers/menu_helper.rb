module MenuHelper

  def login_link
    'login'
  end

  def logged_user
    if current_user
      %Q|<li class="login-name navbar-text">#{current_user}</li>
         <li class="logout-link">#{link_to 'LOGOUT', ''}</li>|
    else
      %Q|<li>#{login_link}</li>|
    end.html_safe
  end

  def dm_menu(&block)
    raw %Q|<header class="navbar navbar-default" role="banner">
             <div class="container">| + capture(&block) + 
        %Q|  </div><!-- container -->
           </header>| + privacy_alert
  end

  def dm_header
    icon   = 'cubes'
    string = "Muri d'Italia" + content_tag(:small, 'muri di arrampicata in Italia')
    %Q|<div class="navbar-header">
         <button class="navbar-toggle collapsed" type="button" data-toggle="collapse" data-target="#bs-navbar-collapse">
           <span class="sr-only">Toggle navigation</span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
           <span class="icon-bar"></span>
         </button>|.html_safe +
    link_to(icon(icon, size: 32), root_path, class: 'navbar-brand navbar-icon') +
    link_to(string.html_safe, root_path, class: 'navbar-brand') +
    %Q|</div><!-- navbar-header -->|.html_safe
  end

  def dm_nav(&block)
    %Q|<nav class="collapse navbar-collapse" id="bs-navbar-collapse">
        <ul class="nav navbar-nav">|.html_safe + capture(&block) +
    %Q| </ul>
       <!-- right -->
       <ul class="nav navbar-nav navbar-right">|.html_safe + logged_user +
    %Q|</ul>
       </nav>|.html_safe
  end

  def dm_footer
    %Q|
    <div id="footer" role="navigation">
      <div class="container" style="text-align: center">
        <a href="http://www.unibo.it/it/ateneo/privacy-e-note-legali/privacy/informative-sul-trattamento-dei-dati-personali">Privacy</a><br/>
      </div>
    </div>|.html_safe
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

