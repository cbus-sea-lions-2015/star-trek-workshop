get '/captains/:id' do
  # wildcards in the path are available in params
  @captain = Captain.find(params[:id])

  # renders the appropriate view
  erb :'captains/show'
end

get '/captains/:id/edit' do
  # get the captain by its id
  @captain = Captain.find(params[:id])
  # render the edit form
  erb :'captains/edit'
end

# params = {captain: {name: "james", username: "jim"}}
put '/captains/:id' do
  # find captain by id
  @captain = Captain.find(params[:id])

  # update captain with data from params
  if @captain.update(params[:captain])
    # redirect to show
    redirect "/captains/#{@captain.id}"
  else
    # render edit
    erb :'captains/edit'
  end
end
