class UsersController < ApplicationController
  def show
    @user = current_user
    if @user.myresaleweb_id && @user.myresaleweb_last_name

    else
      redirect_to('/credentials')
    end
  end

  def new
    @user = current_user
  end
end
