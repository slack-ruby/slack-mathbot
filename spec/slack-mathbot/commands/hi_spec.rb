require 'spec_helper'

describe SlackRubyBot::Commands::Hi do
  def app
    SlackMathbot::App.new
  end
  before do
    app.config.user = 'mathbot'
  end
  it 'says hi' do
    expect(message: 'mathbot hi').to respond_with_slack_message('Hi <@user>!')
  end
end
