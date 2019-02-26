require 'spec_helper'

describe SlackRubyBot::Commands::Hi do
  let(:app) { SlackMathbot::Bot.instance }
  it 'says hi' do
    expect(message: 'mathbot hi').to respond_with_slack_message('Hi <@user>!')
  end
end
