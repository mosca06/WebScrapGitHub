class UsersController < ApplicationController
  before_action :authenticate_user!, only: %i[dashboard]

  def dashboard; end
end
