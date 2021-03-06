class UsersController < ApplicationController

  skip_before_action :authenticate_user
  before_action :set_user, only: [:show, :stars]

  @@sex = ['F', 'M']
  @@avatar = {
      'F' => "#{ActionController::Base.helpers.image_url('sarah.png')}",
      'M' => "#{ActionController::Base.helpers.image_url('michael.png')}"
  }
  #def index
  #  @users = User.all
  #end

  def create
    @user = User.new
    # Fake it!!
    @user.name = Faker::Name.name
    @user.email = Faker::Internet.email
    @user.age = rand(18..45)
    @user.sex = @@sex[rand(0..1)]
    @user.avatar = request.base_url+ @@avatar[@user.sex]

    respond_to do |format|
      if @user.save
        format.json { render json: @user, status: :created }
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end

  #def show
  #  respond_to do |format|
  #    format.json { render json: @user }
  #  end
  #end

  def stars
    reviews = Review.where(user: @user)
    puts reviews
    stars = []
    reviews.each { |r| stars << r.stars if r.stars}
    avg_stars = stars.sum / stars.size.to_f unless stars.empty?
    respond_to do |format|
      format.json { render json: avg_stars }
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
