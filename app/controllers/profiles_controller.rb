class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @profile.user = current_user
    authorize @profile
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    authorize @profile
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
    find_profile
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name)
  end

  def find_profile
    @profile = Profile.find(params[:id])
    authorize @profile
  end

end
