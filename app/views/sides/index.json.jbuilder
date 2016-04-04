json.array!(@sides) do |side|
  json.extract! side, :id, :name, :description, :spicy, :price
  json.url side_url(side, format: :json)
end
