require 'sinatra/base'

module SlackMathbot
  class Web < Sinatra::Base
    get '/' do
      'Math is good for you.'
    end
  end
end
