class DenouncesController < ApplicationController
  before_action :set_denounce, only: [:show, :edit, :update, :destroy]


  def index
    @denounces = Denounce.all
  end

  def new
    @denounce = Denounce.new
    @users = User.all
    @towns = Town.all
    @denounce_types = DenounceType.all
  end

  def create
    @denounce = Denounce.new(denounce_params)
    if @denounce.save
      redirect_to denounces_path, notice: t("denounce_created")
    else
      @users = User.all
      @towns = Town.all
      @denounce_types = DenounceType.all
      render :new
    end
  end

  private

    def set_denounce
      @denounce = Denounce.find(params[:id])
    end

    def denounce_params
      params.require(:denounce).permit(:content, 
                                       :author_user_id,
                                       :denounced_user_id,
                                       :mail,
                                       :town_id
                                       :denounce_type_id )
    end
end
