json.array!(@statuses) do |status|
  json.extract! status, :id, :name, :content, :created_at, :user_id
  json.url status_url(status, format: :json)
end
