class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy];

  def profile
    @my_listings = current_user.listings
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      render :new
    end
  end

  def index
    @listings = Listing.all
  end

  def show
   
  end

  def update
    @listing.update(listing_params)
    if @listing.save
      redirect_to listings_path
    else
      render :edit
    end
  end

  def edit

  end

  def destroy
    @listing.destroy
    #listings/destroy.html.erb
    redirect_to listings_path #index page that shows
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  private
  def listing_params
    params.require(:listing).permit(:name,:description,:tags, :room_type, :beds, {avatars:[]});
  end
end
