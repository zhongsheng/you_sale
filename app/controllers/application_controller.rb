class ApplicationController < ActionController::Base

  private
  def set_title
    @title = t ".title"
  end
end
