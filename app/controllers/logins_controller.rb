# Take a look at http://railscasts.com/episodes/241-simple-omniauth
# The main difference is that we mainly use shibboleth authentication.
#
# in routes we have
#   get 'auth/google_oauth2/callback', to: 'logins#google_oauth2'
#   get 'auth/shibboleth/callback',    to: 'logins#shibboleth'
#   get 'auth/developer/callback',     to: 'logins#developer'
#
# The application that uses dm_unibo_commmon can define two login_methods:
# login_method: :allow_if_email
#   means that only users already present in database can login
# login_method: :allow_and_create
#   means that any user that passes omniauth authentication can login
#   and is saved in database
#
# and in app/controllers/application_controller.rb can add
# before_filter :log_current_user, :force_sso_user
# or
# before_filter :log_current_user, :redirect_unsigned_user
#
# force_sso_user means that all the pages are protected
# redirect_unsigned_user means that unsigned user can still see something (to refactor)
#
# see lib/dm_unibo_common/controllers/helpers.rb for method definitions.
class LoginsController < ApplicationController
  # raise: false see http://api.rubyonrails.org/classes/ActiveSupport/Callbacks/ClassMethods.html#method-i-skip_callback
  skip_before_action :verify_authenticity_token
  skip_before_action :force_sso_user, :redirect_unsigned_user, :check_role, :retrive_authlevel, raise: false

  # env['omniauth.auth'].info = {email, name, last_name}
  def google_oauth2
    parse_google_omniauth
    allow_if_email
  end

  def developer
    Rails.configuration.dm_unibo_common[:omniauth_provider] == :developer or raise
    request.remote_ip == '127.0.0.1' or request.remote_ip == '::1' or request.remote_ip =~ /^172\.17\.\d+\.\d+/  or raise "ONLY LOCAL OF DOCKER. YOU ARE #{request.remote_ip}"
    sign_in_and_redirect User.first
  end

  # example ["_shibsession_lauree", "_affcf2ffbe098d5a0928dc72cd9de489"]
  #         ["_lauree_session", "YU5RSTM2OXdYMkRyVjV0SXI1K3c3eDJJdjZQ..... "]
  def logout
    cookies.delete(Rails.configuration.session_options[:key].to_sym)
    cookies.delete(shibapplicationid.to_sym)
    session[:user_id] = nil
    logger.info("after logout we redirect to params[:return] = #{params[:return]}")
    redirect_to (params[:return] || 'http://www.unibo.it')
  end

  # Not authorized but valid credentials
  def no_access
  end

  def pippo_show
    # raise env.inspect
  end

  private 

  def parse_google_omniauth
    oinfo = env['omniauth.auth'].info
    @email   = oinfo.email
    @name    = oinfo.name
    @surname = oinfo.last_name
  end

  def allow_and_create
    user = @idAnagraficaUnica ? User.where(id: @idAnagraficaUnica).first : User.where(email: @email).first
    if ! user
      logger.info "Authentication: User #{@email} to be CREATED"
      h = {id:      @idAnagraficaUnica || 0,
           upn:     @email,
           email:   @email,
           name:    @name, 
           surname: @surname }
      h[:nationalpin] = @nationalpin if User.column_names.include?('nationalpin')
      user = User.create!(h)
    end
    logger.info "Authentication: allow_and_create as #{user.inspect} with groups #{session[:isMemberOf].inspect}"
    sign_in_and_redirect user
  end
  alias_method :log_and_create, :allow_and_create # old syntax 

  def allow_if_email
    user = @idAnagraficaUnica ? User.where(id: @idAnagraficaUnica).first : User.where(email: @email).first
    if user
      logger.info "Authentication: allow_if_email as #{user.inspect} with groups #{session[:isMemberOf].inspect}"
      user.update_attributes(name: @name, surname: @surname)
      sign_in_and_redirect user
    else
      logger.info "User #{@email} not allowed"
      redirect_to no_access_path
    end
  end
  alias_method :log_if_email, :allow_if_email # old syntax 

  def sign_in_and_redirect(user)
    session[:user_id] = user.id
    redirect_to session[:original_request] || root_path
  end
end

