class ApplicationController < ActionController::Base

  respond_to :html, :js

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include Lev::HandleWith

  interceptor :authenticate_user!

  before_filter :valid_user!

  fine_print_require :general_terms_of_use, :privacy_policy

  protected

  def valid_user!
    return unless current_user.is_deleted?
    sign_out
    redirect_to home_url
  end

end
