module SlackMathbot
  module Hooks
    module Hello
      extend Base

      def hello(_data)
        logger.info "Successfully connected to #{SlackMathbot.config.url}."
      end
    end
  end
end
