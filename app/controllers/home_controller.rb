class HomeController < ApplicationController

  # OPTIMIZE me
  def index
    @products = Product.paginate(page: params[:page], per_page: 30)
  end

  # TODO something
  def show
  end

end
