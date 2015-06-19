module SlackMathbot
  module Hooks
    module Message
      extend Base

      def message(data)
        data = Hashie::Mash.new(data)
        bot_name, command, arguments = parse_command(data.text)
        return unless bot_name == SlackMathbot.config.user
        klass = command_to_class(command || 'Default')
        klass.call data, command, arguments
      end

      private

      def parse_command(text)
        return unless text
        text = '= ' + text[1..text.length] if text[0] == '='
        parts = text.split.reject(&:blank?)
        if parts && parts[0] == '='
          parts[0] = SlackMathbot.config.user
          parts.insert 1, 'calculate'
        end
        [parts.first.downcase, parts[1].try(:downcase), parts[2..parts.length]] if parts && parts.any?
      end

      def command_to_class(command)
        klass = "SlackMathbot::Commands::#{command.titleize}".constantize rescue nil
        klass || SlackMathbot::Commands::Unknown
      end
    end
  end
end
