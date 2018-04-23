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
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def product_params
    return params.require(:product).permit(:name, :price, :category, :quantity, :description)
  end

  def find_product
    @product = Product.find_by(id: params[:id])
    render_404 unless @product
  end
end
