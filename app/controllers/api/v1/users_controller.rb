class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  def index
    authorize User

    @users = User.all
    render json: @users, status: :ok
  end

  def show
  end

  def create
    authorize User
    @user = User.new(user_params)

    if @user.save
      render :show, status: :ok
    else
      @errors = @user.errors.messages
      render :errors, status: :unprocessable_entity
    end
  end

  def update
    if @user.update(user_params)
      render :show, status: :ok
    else
      @errors = @user.errors.messages
      render :errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render :show, status: :ok
    else
      @errors = @user.errors.messages
      render :errors, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(allowed_params)
  end

  def allowed_params
    %i[first_name last_name email password]
  end

  def set_user
    user = User.find_by(id: params[:id])
    return render json: { errors: t('activerecord.errors.messages.item_not_found') }, status: :not_found unless user

    authorize user
    @user = user
  end
end
