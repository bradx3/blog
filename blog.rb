require "rubygems"
require "sinatra"


DIR = File.join(File.dirname(__FILE__), '/output')

set :public, DIR

get '/' do
  read('index.html')
end

get '/articles/*' do
  read('articles', params["splat"], 'index.html')
end

def read(*parts)
  File.read(File.join([ DIR ] + parts))
end
