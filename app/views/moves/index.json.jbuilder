json.array!(@moves) do |move|
  # json.extract! move, :id, :name, :notes, :start_date, :end_date, :times, :distance, :duration, :pace, :rest
  # json.url move_url(move, format: :json)
    if move.type != "Step"
      json.id move.id.to_s
      if move.parent_id.blank? 
        json.parent "#" 
      else 
        json.parent move.parent_id.to_s
      end
      json.text "<strong>" + move.name + "</strong> - " + move.notes + " G: " + move.distance.to_s + " P: " + move.planned_distance.to_s
      json.icon image_path(move.type + "-ciclo")
      href_hash = { :href => move_url(move) } 
      json.a_attr href_hash 
    end
end
