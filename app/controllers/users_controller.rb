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

  def create
    current_user.update({
      myresaleweb_id: params[:user][:myresaleweb_id],
      myresaleweb_last_name: params[:user][:myresaleweb_last_name]
    })

    redirect_to(root_path)
  end

end
