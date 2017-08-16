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
        ping_slack
        true
      else
        false
      end
    end

    private

    def ping_slack
      channel_url = "https://hooks.slack.com/services/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"
      notifier = Slack::Notifier.new channel_url do
        defaults channel: "#general",
                 username: "denouncer"
      end
      notifier.ping "<!channel> #{@author.name} denounced: #{@denounce.denounced_user.name} for: #{@denounce.content}"
    end
  end
end
