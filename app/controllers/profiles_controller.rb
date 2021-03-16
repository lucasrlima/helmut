class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
    @profile.user = current_user
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    @profile.save
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :last_name)
  end

end
