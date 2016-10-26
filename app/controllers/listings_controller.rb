class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy];

  def profile
    @my_listings = current_user.listings
  end

  def search
    @listings = Listing.search(params[:term], fields: ["name", "description","tags"], mispellings: {below: 5})
    if @listings.blank?
      redirect_to listings_path, flash:{danger: "Unforunately, search not found."}
    else
      render :index
    end
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = current_user.listings.new(listing_params)

    if @listing.save
      redirect_to my_listings_path
    else
      render :new
    end
  end

  def index
    if params[:tag]
      @listings = Listing.tagged_with(params[:tag])
    elsif params[:term]
      @listings = Listing.search(params[:term], fields: ["name", "description","tags"], mispellings: {below: 5})
      if @listings.blank?
        flash[:danger] = "Unforunately, search not found."
      end
    else
      @listings = Listing.all
    end
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
    params.require(:listing).permit(:name,:description, :price, :property_type, :country, :guests, :beds, :bathrooms, :tag_list, {avatars:[]}, );
  end
end
