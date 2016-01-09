require 'spec_helper'

describe SlackRubyBot::Commands::Unknown do
  def app
    SlackMathbot::Bot.instance
  end
  let(:client) { app.send(:client) }
  it 'invalid command' do
    expect(message: 'mathbot foobar').to respond_with_slack_message("Sorry <@user>, I don't understand that command!")
  end
  it 'does not respond to sad face' do
    expect(SlackRubyBot::Client).to_not receive(:say)
    SlackMathbot::Bot.instance.send(:message, client, text: ':((')
  end
end
