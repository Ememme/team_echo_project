class DenouncesController < ApplicationController
  before_action :find_town, only: [:create]

  def create
    service = Denounces::CreateService.new(denounce_params, current_user, @town)

    if service.call
      redirect_to town_path(params[:town_id]), notice: t("denounce_created")
    else
      @denounce = service.denounce
      render :new
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
