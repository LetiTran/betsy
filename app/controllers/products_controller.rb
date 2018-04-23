class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :find_user

  def root
    @products = Product.all
  end

  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.merchant_id = @merchant.id
    if @product.save
      flash[:status] = :success
      redirect_to products_path
    else
      flash[:failure] = :failure
      flash.now[:result_text]= "Error: product was not added"
      render :new
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)
      flash[:success] = "#{@product.name} updated"
      redirect_to product_path(@product.id)
    else
      flash[:alert] = "A problem occured:Could not update"

      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:message] = "Deleted #{@product.category} #{@product.name}"
      redirect_to products_path
    end
  end

  private

  def product_params
    return params.require(:product).permit(:name, :price, :quantity, :description, :category_ids => [])
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    render_404 unless @product
  end
end
