json.array!(@moves) do |move|
  # json.extract! move, :id, :name, :notes, :start_date, :end_date, :times, :distance, :duration, :pace, :rest
  # json.url move_url(move, format: :json)
    json.id move.id.to_s
    if move.parent_id.blank? 
      json.parent "#" 
    else 
      json.parent move.parent_id.to_s
    end
    json.text move.name + " - " + move.notes + " : " + move.distance.to_s
    href_hash = { :href => move_url(move) } 
    json.a_attr href_hash 

end
