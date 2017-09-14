class AdminController < ApplicationController
  def index
    redirect_to('/') unless current_user.admin
  end
end
