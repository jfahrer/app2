class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  def index
    @users = User.all
    respond_to do |format|
      format.json { render json: @users }
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
      else
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    respond_to do |format|
      format.json { render json: @user }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.permit(:name, :email, :age, :sex)
  end
end