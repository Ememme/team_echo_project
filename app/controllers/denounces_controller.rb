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
    @denounce.author_user = current_user
    notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
      defaults channel: "#general",
               username: "denounce-bot"
    end
    if @denounce.save
      redirect_to denounces_path, notice: t("denounce_created")
      notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
        defaults channel: "#general",
                 username: "denounce-bot"
      notifier.ping "You've been denounced"
end
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
