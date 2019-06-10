class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home, :help]

  def home
  end

  def help
  end
end
