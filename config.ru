$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack-mathbot'
require 'web'

Thread.new do
  SlackMathbot::App.instance.run
end

run SlackMathbot::Web
