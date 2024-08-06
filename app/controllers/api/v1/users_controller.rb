class Api::V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      render json: UserSerializer.new(@user), status: :created
    else
      render json: ErrorSerializer.new(@user.errors), status: :unprocessable_entity
    end
  end

end