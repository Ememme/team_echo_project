class DenouncesController < ApplicationController
  before_action :find_town, only: [:new, :create]

  def new
    @denounce = @town.denounces.new
  end

  def create
    @denounce = @town.denounces.build(denounce_params)
    @denounce.author_user = current_user
    if @denounce.save
      redirect_to town_path(params[:town_id]), notice: t("denounce_created")
    else
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
                                       :denounce_type_id
                                      )
    end
end
