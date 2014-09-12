class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
    #debugger
    # Product is model which is mapped with table products in database
    # above command creates new record
  end

  # GET /products/1/edit
  # def edit
  # end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    # here @product takes values passed from our new product form
    #debugger
    #it executes insert query here
    respond_to do |format|
      if @product.save
        #here object id get assigned for our object
        debugger
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        # redirect_to @product -->in this it redirects to the show page of the @product object
        #as we are working with product only thus it gets redirected to the show page
        #whtever written with notice: is passed to the variable notice: and we can  use it later
        # debugger
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      #respond_to responds to the request and returns format of the request
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        #it also redirects to the show method of @product
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      #it redirects to the index page
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:title, :description, :image_url, :price)
    end
end
