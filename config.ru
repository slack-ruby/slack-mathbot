require File.expand_path('../app', __FILE__)

Thread.new do
  SlackMathbot::App.instance.run
end

run SlackMathbot::Web
