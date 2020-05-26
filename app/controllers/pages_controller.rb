class PagesController < ApplicationController
  skip_before_action :authentication_user!, only: [ :home, :index, :show ]

  def home
  end

  def index
  end

  def show
  end
end
