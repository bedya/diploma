json.array!(@posds) do |posd|
  json.extract! posd, :id, :title, :body, :publish_date, :user_id
  json.url posd_url(posd, format: :json)
end
