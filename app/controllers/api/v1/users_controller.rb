class Api::V1::UsersController < ApplicationController

  before_action :find_user, only: [:show, :edit, :update, :destroy]


  def index
    @users = User.all


    output = []
    @users.each do |user|
      outputElement = user.toJson
      output.push(outputElement)
    end

    render :json => output.as_json
  end

  def show
    render :json => @user.toJson
  end

  def new
    @user = User.new
  end

  def create
    debugger
    @user = User.find(new_user_params)
    render :json => @user.toJson
    #@user.name = params['user']['name']
    #@user.password = params['user']['password']
    #check that user is valid... if not return an error
  end

  def edit

  end

  def updated
    @user.update(new_user_params)
    #check that is valid
  end

  def destroy
    @user.destroy
  end

  private

  def new_user_params
    params.require(:user).permit(:name,:password, :password_confirmation)
  end

  def find_user
    @user = User.find(params[:id])
  end

end
