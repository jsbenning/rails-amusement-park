class AttractionsController < ApplicationController
  

  def new
    if current_user.admin?
      @attraction= Attraction.new
    else
      render 'show' 
    end 
  end

  def show
    @user = current_user
    @attraction = Attraction.find(params[:id])
  end

  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
 
      redirect_to attraction_path(@attraction), notice: 'New Attraction created!'
    else
      render :new
    end
  end

  def index
    @attractions = Attraction.all
    @user = current_user
  end

  def edit
    @attraction = Attraction.find(params[:id])
  end

  def update
    @attraction = Attraction.find(params[:id])
    if @attraction.update_attributes(attraction_params)
      redirect_to "/attractions/#{@attraction.id}"
    else
      render 'edit'
    end
  end

  private

  def attraction_params
    params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
  end

end

