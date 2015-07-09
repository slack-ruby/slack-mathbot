$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'slack-mathbot'
require 'web'

Thread.new do
  begin
    SlackMathbot::App.instance.run
  rescue Exception => e
    STDERR.puts "ERROR: #{e}"
    STDERR.puts e.backtrace
    raise e
  end
end

run SlackMathbot::Web
