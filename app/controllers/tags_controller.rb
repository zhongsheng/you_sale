class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.where(category_id: params[:category_id])
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
    @product_tags = ProductTag.where({tag_id: params[:id]}).paginate(page: params[:page], per_page: 30)
    @products = Product.find(@product_tags.map{ |p| p.product_id })
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    # respond_to do |format|
    #   if @tag.save
    #     format.html { redirect_to @tag, notice: 'Tag was successfully created.' }
    #     format.json { render :show, status: :created, location: @tag }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @tag.errors, status: :unprocessable_entity }
    #   end
    # end
    @tag.save
    redirect_to Category.find(tag_params[:category_id])
    return
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to @tag, notice: 'Tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @tag }
      else
        format.html { render :edit }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    render js: "$('#tag_#{params[:id]}').remove()"
    # respond_to do |format|
    #   format.html { redirect_to edit_category_url(params[:category_id]), notice: 'Tag was successfully destroyed.' }
    #   format.json { head :no_content }
    #   format.js { }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name, :category_id)
    end
end
