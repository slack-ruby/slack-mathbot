module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      operator '='
      command 'calculate'

      def self.call(data, match)
        result = Dentaku::Calculator.new.evaluate(match[:expression]) if match.names.include?('expression')
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
