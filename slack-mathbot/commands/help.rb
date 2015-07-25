module SlackMathbot
  module Commands
    class Help < SlackRubyBot::Commands::Base
      def self.call(client, data, _match)
        send_message_with_gif client, data.channel, 'See https://github.com/dblock/slack-mathbot, please.', 'help'
      end
    end
  end
end
