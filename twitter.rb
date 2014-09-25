require 'twitter'
require 'sinatra'
require './configure'

# Inicializamos las variables
get '/' do
  @amigos_usuario = []
  @name = ''
  @number = 0
  erb :twitter
end

post '/' do
  @amigos_usuario = []
  client = my_twitter_client() 
  @name = params[:firstname] || ''
  @number = params[:n].to_i
  #@number = 1 if @number < 1

  if (client.user? @name) && (@number <= 10)
    ultimos_t = client.friends(@name, {}).take(@number) # Buscamos a los amigos de ese usuario
    @amigos_usuario =(@amigos_usuario != '') ? ultimos_t.map{ |i| [i.name ,i.followers_count]} : '' # Nos quedamos con el nombre y el número de seguidores
    @amigos_usuario.sort_by!{|a,b| b}.reverse! # Ordenamos por el numero de seguidores
    
  end
  erb :twitter # Invocamos a erb
end