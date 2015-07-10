RSpec.configure do |config|
  config.before do
    SlackRubyBot.config.user = 'mathbot'
  end
end
