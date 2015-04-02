# NEW
get "/ships/:ship_id/crew_members/new" do
  # find the ship by id
  @ship = Ship.find(params[:ship_id])
  # instantiate a crew_member for this ship
  @crew_member = @ship.crew_members.new
  # render the new form
  erb :"crew_members/new"
end

# CREATE
post '/ships/:ship_id/crew_members' do
  # find the ship by id
  @ship = Ship.find(params[:ship_id])
  # create a new crew_member for the ship
  @crew_member = @ship.crew_members.new(params[:crew_member])
  if @crew_member.save
  # redirect to ship's show
    redirect ship_path(@ship)
  else
    erb :"crew_members/new"
  end
end

delete '/ships/:ship_id/crew_members/:id' do
  @ship = Ship.find(params[:id])
  @crew_member = @ship.crew_members.find(params[:id])
  @crew_member.destroy
  redirect "/ships/#{@ship.id}"
end

"/ships/10/crew_members/175"
