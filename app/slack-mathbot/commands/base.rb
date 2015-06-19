module SlackMathbot
  module Commands
    class Base
      def self.send_message(channel, text)
        Slack.chat_postMessage(channel: channel, text: text)
      end

      def self.logger
        @logger ||= begin
          $stdout.sync = true
          Logger.new(STDOUT)
        end
      end
    end
  end
end
