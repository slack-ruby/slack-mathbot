module SlackMathbot
  module Commands
    class Hi < Base
      def self.call(data, _command, _arguments)
        send_message data.channel, "Hi <@#{data.user}>!"
      end
    end
  end
end
