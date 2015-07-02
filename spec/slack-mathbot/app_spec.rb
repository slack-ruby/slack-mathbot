require 'spec_helper'

describe SlackMathbot::App do
  def app
    SlackMathbot::App.new
  end
  it_behaves_like 'a slack ruby bot'
end
