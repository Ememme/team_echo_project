class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	if current_user.id == @user.id
      @reported_denounces = @user.reported_denounces.paginate(:page => params[:rep_page], :per_page => 10).decorate
      @received_denounces = @user.received_denounces.paginate(:page => params[:rec_page], :per_page => 10).decorate
	else
	  redirect_to root_path
	end
  end
  def ranking
    @users = User.order('points DESC').limit(20).decorate
  end
end
