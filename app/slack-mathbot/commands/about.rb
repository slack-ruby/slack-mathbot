module SlackMathbot
  module Commands
    class Default < Base
      def self.call(data, _command, _arguments)
        send_message data.channel, SlackMathbot::ABOUT
      end
    end
  end
end
