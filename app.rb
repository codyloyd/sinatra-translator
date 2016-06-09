require 'sinatra'
require 'sinatra/reloader' if development?


get '/' do 
	erb :index
end

post '/' do
	@message = cipher(params[:text],params[:key])
	erb :index 
end

def shift_char(result, offset)
  (((result - offset) % 26) + offset).chr
end

def cipher(message,key)
	array = message.scan(/./)		
	array.map! do |char|
	  if char.ord.between?(64,91)
	    shift_char(char.ord + key.to_i, 65)
	  elsif char.ord.between?(96,123)
	    shift_char(char.ord + key.to_i, 97)
	  else
	    char
	  end
	end
	array.join
end
