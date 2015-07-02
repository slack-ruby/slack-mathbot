require 'spec_helper'

describe SlackMathbot::Commands::Default do
  def app
    SlackMathbot::App.new
  end
  before do
    app.config.user = 'mathbot'
  end
  it 'mathbot' do
    expect(message: 'mathbot').to respond_with_slack_message(SlackMathbot::ABOUT)
  end
  it 'Mathbot' do
    expect(message: 'Mathbot').to respond_with_slack_message(SlackMathbot::ABOUT)
  end
end
