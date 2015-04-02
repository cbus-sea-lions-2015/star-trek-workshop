# INDEX
get "/ships" do
  # find all the ships
  @ships = Ship.all
  # render the index
  erb :"ships/index"
end

# NEW
get "/ships/new" do
  # instantiate a blank ship (for use by the form)
  @ship = Ship.new
  # render the new form
  erb :"ships/new"
end

# CREATE
post "/ships" do
  # create a new ship from the user params
  ship = Ship.new(params[:ship])
  # if the ship is saved
  if ship.save
    # redirect to show
    redirect ship_path(ship)
  else
    # render the new form (with the ship with errors)
    erb :"ships/new"
  end
end

get "/ships/:id" do
  # find the ship by id
  @ship = Ship.find(params[:id])
  # render the show view
  erb :"ships/show"
end

get "/ships/:id/edit" do
  # find the ship by id
  @ship = Ship.find(params[:id])
  # render the edit form
  erb :"ships/edit"
end

put "/ships/:id" do
  # find the ship by id
  ship = Ship.find(params[:id])
  # update the ship by params from form
  ship.update(params[:ship])
  # redirect to show
  redirect ship_path(ship)
end

# DELETE
delete "/ships/:id" do
  # find the ship by id
  ship = Ship.find(params[:id])
  # destroy the ship (with fire)
  ship.destroy
  # redirect to index
  redirect ships_path
end