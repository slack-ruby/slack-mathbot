require 'slack-mathbot/version'
require 'slack-mathbot/about'
require 'slack-mathbot/config'
require 'slack-mathbot/hooks'
require 'slack-mathbot/commands'
require 'slack-mathbot/app'

module SlackMathbot
  class << self
    def configure
      block_given? ? yield(Config) : Config
    end

    def config
      Config
    end
  end
end
