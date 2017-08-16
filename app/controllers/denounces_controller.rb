class DenouncesController < ApplicationController
  before_action :find_town, only: [:create]

  def create
    @denounce = @town.denounces.build(denounce_params)
    @denounce.author_user = current_user

    if @denounce.save
      notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
        defaults channel: "#general",
                 username: "denouncer"
      end
      notifier.ping "<!channel> #{current_user.name} denounced: #{@denounce.denounced_user.name} for: #{@denounce.content}"

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
