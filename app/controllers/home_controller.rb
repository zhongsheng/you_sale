class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show, :index]
  # OPTIMIZE me
  def index
    @products = Product.paginate(page: params[:page], per_page: 30)
  end

  # TODO something
  def show
  end

end
