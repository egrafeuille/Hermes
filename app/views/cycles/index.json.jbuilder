json.array!(@cycles) do |cycle|
#    json.extract! cycle, :id, :parent_id, :name
#   json.url cycle_url(cycle, format: :json)
    json.id cycle.id.to_s
    if cycle.parent_id.blank? 
    	json.parent "#" 
    else 
    	json.parent cycle.parent_id.to_s
    end
    json.text cycle.name
end