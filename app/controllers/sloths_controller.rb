class SlothsController < ApplicationController
  before_action :set_sloth, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [ :index, :show ]
  def index
    @sloths = policy_scope(Sloth).order(created_at: :desc)

    @sloths = Sloth.geocoded # returns sloths with coordinates
    @markers = @sloths.map do |sloth|
      {
        lat: sloth.latitude,
        lng: sloth.longitude,
        infoWindow: render_to_string(partial: "map", locals: { sloth: sloth })
      }
    end
  end

  def show
    # @sloths = Sloth.geocoded # returns sloths with coordinates
    @markers = [{
        lat: @sloth.latitude,
        lng: @sloth.longitude
        # infoWindow: render_to_string(partial: "info_window", locals: { sloth: sloth })
      }]
    @sloth = Sloth.find(params[:id])
    @booking = Booking.new
    authorize @booking
  end

  def new
    @sloth = Sloth.new
    authorize @sloth
  end

  def create
    @sloth = Sloth.new(sloth_params)
    @sloth.user = current_user
    if @sloth.save
      redirect_to @sloth, notice: 'Sloth was successfully created.'
    else
      render :new
    end
    authorize @sloth
  end

  def edit
  end

  def update
    if @sloth.update(sloth_params)
      redirect_to @sloth, notice: 'Sloth was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @sloth.destroy
    redirect_to root_path
  end

  private

  def set_sloth
    @sloth = Sloth.find(params[:id])
    authorize @sloth
  end

  def sloth_params
    params.require(:sloth).permit(:name, :address, :price, :details, photos: [])
  end
end
