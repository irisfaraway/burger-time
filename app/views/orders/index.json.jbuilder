json.array!(@orders) do |order|
  json.extract! order, :id, :eater, :order_date, :order_price, :paid
  json.url order_url(order, format: :json)
end
