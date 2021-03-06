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

  def index
    if params[:query].present?
      @profiles = policy_scope(Profile).search_profile_index(params[:query]).where(role: "Fotógrafo")
    else
      @profiles = policy_scope(Profile).where(role: "Fotógrafo").order(first_name: :asc)
    end 
  end

  def edit
    find_profile
  end

  def update
    find_profile
    @profile.update(profile_params)
    redirect_to profile_path(@profile)
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :role)
  end

  def find_profile
    @profile = Profile.find(params[:id])
    authorize @profile
  end

end
