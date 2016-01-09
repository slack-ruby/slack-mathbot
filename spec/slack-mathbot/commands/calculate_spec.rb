require 'spec_helper'

describe SlackMathbot::Commands::Calculate do
  def app
    SlackMathbot::Bot.instance
  end
  it 'adds two numbers' do
    expect(message: 'mathbot calculate 2+2', channel: 'channel').to respond_with_slack_message('4')
  end
  it 'adds two numbers via =' do
    expect(message: '= 2+2', channel: 'channel').to respond_with_slack_message('4')
  end
  it 'adds two numbers via = without a space' do
    expect(message: '=2+2', channel: 'channel').to respond_with_slack_message('4')
  end
  it 'sends something without an answer' do
    expect(message: 'mathbot calculate pi', channel: 'channel').to respond_with_slack_message('Got nothing.')
  end
  it 'reports division by zero' do
    expect(message: 'mathbot calculate 1/0', channel: 'channel').to respond_with_slack_message('Sorry, ZeroDivisionError.')
  end
end
