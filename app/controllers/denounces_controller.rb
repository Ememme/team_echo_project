class DenouncesController < ApplicationController
  before_action :set_denounce, only: [:show, :edit, :update, :destroy]


  def index
    @denounces = Denounce.all.decorate
  end

  def new
    @denounce = Denounce.new
    @users = User.all
    @towns = Town.all
    @denounce_types = DenounceType.all
  end

  def create
    @denounce = Denounce.new(denounce_params)
    @denounce.author_user = current_user

    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
      defaults channel: "#general",
               username: "denouncer"
    end
    if @denounce.save
      redirect_to denounces_path, notice: t("denounce_created")
      notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
        defaults channel: "#general",
                 username: "denouncer"
      end
      notifier.ping "<!channel> #{current_user.name} denounced: #{@denounce.denounced_user.name} for: #{@denounce.content}"
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
                                       :denounced_user_id,
                                       :mail,
                                       :town_id,
                                       :denounce_type_id )
    end
end
