require 'spec_helper'

describe SlackMathbot::Commands::Unknown, vcr: { cassette_name: 'user_info' } do
  it 'invalid command' do
    expect(message: 'mathbot foobar').to respond_with_slack_message("Sorry <@user>, I don't understand that command!")
  end
  it 'does not respond to sad face' do
    expect(SlackMathbot::Commands::Base).to_not receive(:send_message)
    SlackMathbot::App.new.send(:message, text: ':((')
  end
end
