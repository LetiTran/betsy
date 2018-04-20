class CategoriesController < ApplicationController
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
  end

  def new
    @category = Category.new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def category_params
    return params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find_by(id: params[:id])
  end
end
