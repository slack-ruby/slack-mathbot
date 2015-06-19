require 'spec_helper'

describe SlackMathbot::Commands::Hi do
  it 'says hi' do
    expect(message: 'mathbot hi').to respond_with_slack_message('Hi <@user>!')
  end
end
