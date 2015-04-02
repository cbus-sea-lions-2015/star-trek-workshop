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

# logout?
get '/logout' do
  # clear the id we stored in the session
  session.delete(:id)
  # session[:id] = nil
  # session.clear # zomg... kill it all with fire.

  # redirect back to index or login
  redirect '/'
end
