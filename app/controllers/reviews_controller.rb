class ReviewsController < ApplicationController
  before_action :find_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
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

  def review_params
    return params.require(:review).permit(:rating, :comment)
  end

  def find_review
    @review = Review.find_by(id: params[:id])
    render_404 unless @review
  end
end
