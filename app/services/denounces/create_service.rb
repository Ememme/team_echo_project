module Denounces
  class CreateService
    attr_reader :denounce
    def initialize(params, author, town)
      @params = params
      @author = author
      @town = town
    end

    def call
      @denounce = @town.denounces.build(@params)
      @denounce.author_user = @author

      if @denounce.save
        notifier = Slack::Notifier.new "https://hooks.slack.com/services/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" do
          defaults channel: "#general",
                   username: "denouncer"
        end
        notifier.ping("<!channel> #{@author.decorate.author_slack_name(@denounce.id)} #{I18n.t("denounced")} #{@denounce.denounced_user.name} #{I18n.t("for")} #{@denounce.content}")

        true
      else
        false
      end   
    end


  end
end