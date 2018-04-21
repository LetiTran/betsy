class CategoriesController < ApplicationController
  before_action :find_category, only: [:show, :edit, :update, :destroy]

  def index
    @categories = Category.all
  end

  def show
    find_category
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:status] = :success
      flash[:result_text] = "Successfully created #{@category.name}"
      redirect_to categories_path(@category.id)
    else
      flash[:status] = :failure
      flash[:result_text] = "Could not create this category"
      redirect_to categories_path
    end
  end

  def update
    find_category
  end

  def edit
    find_category
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
