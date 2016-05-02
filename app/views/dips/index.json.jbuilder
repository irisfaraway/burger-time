json.array!(@dips) do |dip|
  json.extract! dip, :id, :name, :spicy, :price
  json.url dip_url(dip, format: :json)
end
