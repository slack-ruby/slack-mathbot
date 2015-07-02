module SlackRubyBot
  module Hooks
    module Message
      private

      # TODO: remove monkey-patch
      def parse_command(text)
        return unless text
        text = '= ' + text[1..text.length] if text[0] == '='
        parts = text.split.reject(&:blank?)
        if parts && parts[0] == '='
          parts[0] = SlackRubyBot.config.user
          parts.insert 1, 'calculate'
        end
        [parts.first.downcase, parts[1].try(:downcase), parts[2..parts.length]] if parts && parts.any?
      end
    end
  end
end
