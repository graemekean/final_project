json.array!(@sessions) do |session|
  json.extract! session, :id, :title, :bpm, :key, :creator, :genre, :public, :editable, :description, :created_at, :published, :published_at, :preview_url, :user_id
  json.url session_url(session, format: :json)
end
