class RidesController < ApplicationController
   skip_before_action :verify_authenticity_token

  def create
    @ride = Ride.new(attraction_id: params[:attraction_id], user_id: params[:user_id])
    @user = User.find(params[:user_id])
    redirect_to user_path(@user), notice: @ride.take_ride
  end

  private

end
