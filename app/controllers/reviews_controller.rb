class ReviewsController < ApplicationController

  before_action :find_review, only: [:show, :edit,:update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
    product = Product.find_by(id: params[:product_id])

  end

  def create

    product = Product.find_by(id: params[:product_id])
    # if session[:merchant_id] = @product.merchant_id
    #   flash[:status] = :failure
    #   flash[:result_text]= "AS a merchant u cannot review your own product"
    #   redirect_to product_path(@product.id)
    # else
    @review = Review.new(review_params)
    @review.product_id = @product.id

   if @review.save
     flash[:success] = "#{@review.rating} saved"
     redirect_to product_path(@review.product)
   else
     flash[:alert] = "Could not create #{@review.rating}"
     render :new
   end
 #end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def review_params
     return params.require(:review).permit(:rating, :comment)
  end

  def find_review
    @review = Review.find_by(id: params[:id])

  end
end
