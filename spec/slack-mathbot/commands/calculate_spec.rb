require 'spec_helper'

describe SlackMathbot::Commands::Calculate, vcr: { cassette_name: 'user_info' } do
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
end
