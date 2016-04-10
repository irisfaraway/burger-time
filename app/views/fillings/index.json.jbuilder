json.array!(@fillings) do |filling|
  json.extract! filling, :id, :name, :spicy, :price
  json.url filling_url(filling, format: :json)
end
