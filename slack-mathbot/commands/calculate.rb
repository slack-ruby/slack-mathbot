module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      def self.call(data, _command, arguments)
        result = Dentaku::Calculator.new.evaluate(arguments.join)
        result = result.to_s if result
        if result && result.length > 0
          send_message data.channel, result
        else
          send_message_with_gif data.channel, 'Got nothing.', 'nothing'
        end
      rescue StandardError => e
        send_message_with_gif data.channel, "Sorry, #{e.message}.", 'idiot'
      end
    end
  end
end
