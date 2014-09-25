# -*- coding: utf-8 -*-
require 'twitter'
require 'sinatra'

require './configure'

#Inicializamos las  variables
get '/' do
	@name = ''
	@number = 0
	@number_total = 0
	@users = []
	erb :twitter
end

post '/' do
    req = Rack::Request.new(env)
    client = my_twitter_client() 
    binding.pry if ARGV[0]
   
  
        @name = (req["firstname"] && req["firstname"] != '' && client.user?(req["firstname"]) == true ) ? req["firstname"] : ''  #Si no esta vacio , no es un espacio y el usuario existe en Twitter el nombre es el introducido
	@number = (req["n"] && req["n"].to_i>1 ) ? req["n"].to_i : 1	
	@number_total = @number #Numero maximo de consulta para no sobrepasar el ancho de banda
	@number = 10 if @number > 10	
	if @name == req["firstname"] #Si el nombre existe buscamos sus últimos Tweets
		seguidores = client.friends(@name,{}) # Buscamos a los amigos de ese usuario	
		seguidores = seguidores.map { |i| [i.name , i.followers_count]} # Nos quedamos con el nombre y el número de seguidores
		@users = seguidores.sort_by!{|k,v| -v} # Ordenamos por el número de seguidores
		@users.take(@number)
	end
	erb :twitter #Invoca a erb
	
end