class AppearancesController < ApplicationController

  def new
    @appearance = Appearance.new
  end

  def create
    # byebug
    @appearance = Appearance.new(appearance_params)
    @appearance.user_id = current_user.id
    # @appearance.user_id =
    if @appearance.valid?
      @appearance.save
      redirect_to @appearance.episode
    else
      redirect_to new_appearance_path
    end
  end


  def edit
    # byebug
    @appearance = Appearance.find(params[:id])
    # redirect_to appearance_path(@appearance)

  end

  def show
    @appearance = Appearance.find(params[:id])
    # byebug

  end


  def update
    @appearance = Appearance.find(params[:id])
    @appearance.update(rating: appearance_params[:rating])
    redirect_to appearance_path(@appearance)
    # else
    #   redirect_to edit_appearance(@appearance)
    # end



  end

  private

  def appearance_params
    params.require(:appearance).permit(:guest_id, :episode_id, :rating)
  end

end
