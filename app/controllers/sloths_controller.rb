class SlothsController < ApplicationController
  before_action :set_sloth, only: [ :show, :edit, :update, :destroy ]

  def index
    @sloths = policy_scope(Sloth).order(created_at: :desc)
    @sloths = Sloth.geocoded # returns sloths with coordinates

    @markers = @sloths.map do |sloth|
      {
        lat: sloth.latitude,
        lng: sloth.longitude
      }
    end
  end

  def show
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
