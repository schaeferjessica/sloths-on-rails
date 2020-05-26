class PagesController < ApplicationController
  skip_before_action :authentication_user!, only: [ :home ]

  def home
  end
end
