module SlackMathbot
  module Commands
    class Calculate < SlackRubyBot::Commands::Base
      operator '='
      command 'calculate'

      def self.call(client, data, match)
        expression = match[:expression] if match.names.include?('expression')
        result = Dentaku::Calculator.new.evaluate!(expression) if expression
        result = result.to_s if result
        if result && !result.empty?
          client.say(channel: data.channel, text: result)
        else
          client.say(channel: data.channel, text: 'Got nothing.', gif: 'nothing')
        end
      rescue StandardError => e
        client.say(channel: data.channel, text: "Sorry, #{e.message}.", gif: 'idiot')
      end
    end
  end
end
