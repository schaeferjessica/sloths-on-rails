class BookingsController < ApplicationController
  before_action :set_booking, only: [ :show, :edit, :update, :destroy ]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
    @owner_bookings = @bookings.where(user: current_user)
  end

  def show
  end

  def new
    @sloth = Sloth.find(params[:sloth_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @sloth = Sloth.find(params[:sloth_id])
    @booking = Booking.new(booking_params)
    @booking.sloth = @sloth
    @booking.user = current_user
    @booking.status = "Pending"
    authorize @booking

    start_date = @booking.start_date.to_date #total_cost logic
    end_date = @booking.end_date.to_date
    days = end_date - start_date
    @booking.total_cost = days.to_i * @sloth.price

    if @booking.save
      redirect_to booking_path(@booking), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to booking_path(@booking), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
