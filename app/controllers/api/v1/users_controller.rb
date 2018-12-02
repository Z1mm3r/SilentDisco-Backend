class Api::V1::UsersController < ApplicationController

# TODO chang these over to strong params

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new()
    @user.name = params['user']['name']
    @user.password = params['user']['password']
  end

end
