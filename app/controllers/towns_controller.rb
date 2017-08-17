class TownsController < ApplicationController
  before_action :authenticate_user!

  def show
    @town = Town.includes(:denounces).find(params[:id])
    @denounces = @town.denounces
                      .order(created_at: :desc)
                      .includes(:author_user, :denounced_user)
                      .paginate(page: params[:page], per_page: 15)
                      .decorate
    @denounce = @town.denounces.build
  end
end
