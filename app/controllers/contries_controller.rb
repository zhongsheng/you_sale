class ContriesController < ApplicationController
  before_action :set_contry, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:show, :index]
  # GET /contries
  # GET /contries.json
  def index
    @contries = Contry.all
  end

  # GET /contries/1
  # GET /contries/1.json
  def show
    @products = Product.where({contry_id: params[:id]}).paginate(page: params[:page], per_page: 30)

  end

  # GET /contries/new
  def new
    @contry = Contry.new
  end

  # GET /contries/1/edit
  def edit
  end

  # POST /contries
  # POST /contries.json
  def create
    @contry = Contry.new(contry_params)

    respond_to do |format|
      if @contry.save
        format.html { redirect_to @contry, notice: 'Contry was successfully created.' }
        format.json { render :show, status: :created, location: @contry }
      else
        format.html { render :new }
        format.json { render json: @contry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contries/1
  # PATCH/PUT /contries/1.json
  def update
    respond_to do |format|
      if @contry.update(contry_params)
        format.html { redirect_to @contry, notice: 'Contry was successfully updated.' }
        format.json { render :show, status: :ok, location: @contry }
      else
        format.html { render :edit }
        format.json { render json: @contry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contries/1
  # DELETE /contries/1.json
  def destroy
    @contry.destroy
    respond_to do |format|
      format.html { redirect_to contries_url, notice: 'Contry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contry
      @contry = Contry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contry_params
      params.require(:contry).permit(:name)
    end
end
