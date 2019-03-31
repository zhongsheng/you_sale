class ApplicationController < ActionController::Base
  before_action :set_title
  before_action :authenticate_user!

  private
  def set_title
    @title = t ".title"
  end
end
