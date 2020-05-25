class SlothsController < ApplicationController
  before_action :set_sloth, only: [ :show, :edit, :update, :destroy ]
  def index
    @sloths = Sloth.all
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
    @sloth.destroy
    redirect_to root_path
  end

  private

  def set_sloth
    sloth = Sloth.find(params[:id])
  end

  def sloth_params
    params.require(:sloth).permit(:name, :address, :price)
  end
end
