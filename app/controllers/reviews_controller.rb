class ReviewsController < ApplicationController
  before_action :find_sloth, only: [:new, :create]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.sloth = @sloth
    if @review.save
      redirect_to sloth_path(@sloth)
    else
      render :new
    end
  end

  private

  def find_sloth
    @sloth = Sloth.find(params[:sloth_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
