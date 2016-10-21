class ReservationsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]


  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.new(reservation_params)
    if @reservation.save
      redirect_to listings_path
      # listings_path : index page
      # listing_path : show page so u need to tell which object
    else
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def index
  end

  def show
  end


  private
  def set_listing
    @reservation = Reservation.find(params[:id])
  end


  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :listing_id);
  end
end
