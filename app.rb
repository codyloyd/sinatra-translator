require 'sinatra'
require 'sinatra/reloader'


get '/hi' do 
	'hello wurld'
end

get '/' do 
	erb :index
end

post '/' do
	@message = translate(params[:text])
	erb :index 
end



def translate(word)
	word + "poop"
end