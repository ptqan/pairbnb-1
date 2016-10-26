class ReservationsController < ApplicationController
  before_action :require_login, only: [:new, :create]
  before_action :set_listing, only: [:show, :edit, :update, :destroy]


  def new
    @listing = Listing.find(params[:listing_id])
    @reservation = Reservation.new
    @unavailable_dates = AvailableDate.where(listing_id: params[:listing_id])
    @unavailable_dates = @unavailable_dates.pluck(:unavailable_date).map{ |a| a.strftime('%d-%m-%Y') }
  end

  def create
    @listing = Listing.find(reservation_params[:listing_id])
    start_date = Date.parse(reservation_params[:check_in])
    end_date = Date.parse(reservation_params[:check_out])
    total_days = end_date.mjd - start_date.mjd
    @reservation = current_user.reservations.new(check_in: reservation_params[:check_in], check_out: reservation_params[:check_out], total_sum: reservation_params[:total_sum].to_i * total_days, listing_id: reservation_params[:listing_id])



    if @reservation.save
      total_days.times do

        @listing.available_dates << AvailableDate.create(unavailable_date: start_date)
          start_date += 1
      end
      redirect_to my_reservations_path
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

  def profile
    @my_reservations = current_user.reservations
  end


  private
  def set_listing
    @reservation = Reservation.find(params[:id])
  end


  def reservation_params
    params.require(:reservation).permit(:check_in, :check_out, :total_sum, :listing_id);
  end
end
