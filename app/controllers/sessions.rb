get '/sessions/new' do
  erb :"sessions/new"
end

post '/sessions' do
  captain = Captain.authenticate(params[:username], params[:password])

  if captain
    session[:id] = captain.id
    redirect "/captains/#{captain.id}"
  else
    @message = "Wrong stuff, Captain"
    erb :"sessions/new"
  end
end
