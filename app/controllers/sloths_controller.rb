class SlothsController < ApplicationController
  before_action :set_sloth, only: [ :show, :edit, :update, :destroy ]
  def index
    @sloths = policy_scope(Sloth)
  end

  def show
  end

  def new
    @sloth = Sloth.new
    authorize @sloth
  end

  def create
    authorize @sloth
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
    authorize @sloth
  end

  def sloth_params
    params.require(:sloth).permit(:name, :address, :price)
  end
end
