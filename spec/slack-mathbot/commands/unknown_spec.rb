require 'spec_helper'

describe SlackRubyBot::Commands::Unknown do
  let(:app) { SlackMathbot::Bot.instance }
  let(:client) { app.send(:client) }
  let(:message_hook) { SlackRubyBot::Hooks::Message.new }
  it 'invalid command' do
    expect(message: 'mathbot foobar').to respond_with_slack_message("Sorry <@user>, I don't understand that command!")
  end
  it 'does not respond to sad face' do
    expect(SlackRubyBot::Client).to_not receive(:say)
    message_hook.call(client, Hashie::Mash.new(text: ':(('))
  end
end
