class ApplicationController < ActionController::Base
  #didn't use Pundit , though I prefer Pundit
  include Pundit

  protect_from_forgery with: :null_session
  before_action :authenticate_user!
end
