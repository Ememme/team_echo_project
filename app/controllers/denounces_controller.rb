class DenouncesController < ApplicationController
  before_action :find_town, only: [:create]
  before_action :authenticate_user!

  def create
    service = Denounces::CreateService.new(denounce_params, current_user, @town)

    if service.call
      redirect_to town_path(params[:town_id]), notice: t("denounce_created")
    else
      @denounce = service.denounce

      @town = Town.includes(:denounces).find(params[:town_id])
      @denounces = @town.denounces
                        .order(created_at: :desc)
                        .includes(:author_user, :denounced_user)
                        .paginate(page: params[:page], per_page: 30)
                        .decorate
      render "towns/show"

    end
  end

  private

  def find_town
    @town = Town.find(params[:town_id])
  end

  def denounce_params
    params.require(:denounce).permit(:content,
                                     :denounced_user_id,
                                     :denounce_type_id)
  end
end
