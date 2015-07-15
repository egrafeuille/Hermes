json.array!(@macros) do |macro|
  json.extract! macro, :id, :name, :notes, :startDate, :endDate, :volume
  json.url macro_url(macro, format: :json)
end
