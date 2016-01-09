require 'spec_helper'

describe SlackMathbot::Commands::Help do
  def app
    SlackMathbot::Bot.instance
  end
  it 'help' do
    expect(message: 'mathbot help').to respond_with_slack_message('See https://github.com/dblock/slack-mathbot, please.')
  end
end
