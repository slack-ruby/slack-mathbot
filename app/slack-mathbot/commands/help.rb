module SlackMathbot
  module Commands
    class Help < Base
      def self.call(data, _command, _arguments)
        send_message data.channel, 'See https://github.com/dblock/slack-mathbot, please.'
      end
    end
  end
end
