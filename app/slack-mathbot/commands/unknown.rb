module SlackMathbot
  module Commands
    class Unknown < Base
      def self.call(data, _command, _arguments)
        send_message data.channel, "Sorry <@#{data.user}>, I don't understand that command!"
      end
    end
  end
end
