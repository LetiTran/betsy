class ProductsController < ApplicationController
  def root
    @products = Products.all
  end

  def index
    @products = Product.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
