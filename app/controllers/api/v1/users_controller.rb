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
    if params[:user][:password_confirmation]
      @user = User.create(new_user_params)
    else
      @user = User.find_by({name: new_user_params[:name]})
    end
    if @user.valid?
      render :json => {user: @user.toJson}.to_json
    else
      render :json => {user: @user.toJson, status: 500, errors: @user.errors.full_messages}.to_json
    end
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
