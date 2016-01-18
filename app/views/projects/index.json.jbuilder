json.array!(@projects) do |project|
  json.extract! project, :id, :title, :bpm, :key, :creator, :genre, :public, :editable, :description, :created_at, :published, :published_at, :preview_url, :user_id
  json.url project_url(project, format: :json)
end
