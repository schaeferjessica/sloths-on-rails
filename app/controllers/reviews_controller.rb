class ReviewsController < ApplicationController
  before_action :find_booking, only: [:new, :create]

  def new
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    authorize @review
    if @review.save
      redirect_to booking_path(@booking)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def blank_stars
    5 - rating.to_i
  end

  private

  def find_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
