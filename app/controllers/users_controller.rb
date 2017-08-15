class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @reported_denounces = @user.reported_denounces.paginate(:page => params[:rep_page], :per_page => 10)
    @received_denounces = @user.received_denounces.paginate(:page => params[:rec_page], :per_page => 10)
  end
end
