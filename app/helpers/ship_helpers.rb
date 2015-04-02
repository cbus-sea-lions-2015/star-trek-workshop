helpers do
  def ships_path
    "/ships"
  end

  def ship_path(ship)
    "/ships/#{ship.id}"
  end

  def new_ship_path
    "/ships/new"
  end

  def edit_ship_path(ship)
    "/ships/#{ship.id}/edit"
  end
end