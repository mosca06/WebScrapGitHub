class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :fetch_profile, only: %i[show edit update destroy]

  def index
    @profiles = current_user.profiles
  end

  def show; end

  def new
    @profile = current_user.profiles.new
  end

  def edit; end

  def create
    @profile = current_user.profiles.new(profile_params)
    return redirect_to @profile if @profile.save

    render :new, status: :unprocessable_entity
  end

  def update
    return redirect_to @profile if @profile.update(profile_params)

    render :edit, status: :unprocessable_entity
  end

  def destroy
    @profile.destroy
    redirect_to profiles_path
  end

  private

  def profile_params
    params.require(:profile).permit(:name)
  end

  def fetch_profile
    @profile = current_user.profiles.find_by(id: params[:id])
  end
end
