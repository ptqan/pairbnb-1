class UsersController < ApplicationController

	before_action :set_listing, only: [:show, :edit, :update,:delete_image]

  def show 
    
  end

	def edit

	end

	def update
    @user.update(user_params)
    
    if @user.save
      redirect_to listings_path
    else
      render :edit
    end
  end

  def delete_image
  	@user.remove_avatar!

  	@user.save
  	redirect_to listings_path
  end


	def set_listing
    @user = User.find(params[:id])
  end

  private
  def user_params
    params.require(:user).permit(:email,:avatar)
  end

end