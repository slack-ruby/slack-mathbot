module SlackMathbot
  class App
    cattr_accessor :hooks

    include SlackMathbot::Hooks::Hello
    include SlackMathbot::Hooks::Message

    def initialize
      SlackMathbot.configure do |config|
        config.token = ENV['SLACK_API_TOKEN'] || fail("Missing ENV['SLACK_API_TOKEN'].")
      end
      Slack.configure do |config|
        config.token = SlackMathbot.config.token
      end
    end

    def config
      SlackMathbot.config
    end

    def self.instance
      @instance ||= SlackMathbot::App.new
    end

    def run
      auth!
      start!
    end

    def stop!
      client.stop
    end

    private

    def logger
      @logger ||= begin
        $stdout.sync = true
        Logger.new(STDOUT)
      end
    end

    def start!
      loop do
        client.start
        @client = nil
      end
    end

    def client
      @client ||= begin
        client = Slack.realtime
        hooks.each do |hook|
          client.on hook do |data|
            begin
              send hook, data
            rescue StandardError => e
              logger.error e
              begin
                Slack.chat_postMessage(channel: data['channel'], text: e.message) if data.key?('channel')
              rescue
                # ignore
              end
            end
          end
        end
        client
      end
    end

    def auth!
      auth = Slack.auth_test
      SlackMathbot.configure do |config|
        config.url = auth['url']
        config.team = auth['team']
        config.user = auth['user']
        config.team_id = auth['team_id']
        config.user_id = auth['user_id']
      end
      logger.info "Welcome '#{SlackMathbot.config.user}' to the '#{SlackMathbot.config.team}' team at #{SlackMathbot.config.url}."
    end
  end
end
