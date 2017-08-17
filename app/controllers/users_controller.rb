class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])

    if current_user.id == @user.id
      @reported_denounces = paginated_reported_denounces
      @received_denounces = paginated_received_denounces
    else
      redirect_to root_path
    end
  end

  def ranking
    @users = User.order('points DESC').limit(20).decorate
  end

  private

  def paginated_reported_denounces
    @user.reported_denounces.paginate(page: params[:rep_page], per_page: 10).decorate
  end

  def paginated_received_denounces
    @user.received_denounces.paginate(page: params[:rec_page], per_page: 10).decorate
  end
end
