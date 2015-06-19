module SlackMathbot
  module Commands
    class Calculate < Base
      def self.call(data, _command, arguments)
        result = Dentaku::Calculator.new.evaluate(arguments.join) || 'Got nothing.'
        send_message data.channel, result.to_s
      end
    end
  end
end
