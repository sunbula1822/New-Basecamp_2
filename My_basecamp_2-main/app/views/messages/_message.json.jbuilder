json.extract! message, :id, :name, :description, :project_id, :created_at, :updated_at
json.url message_url(message, format: :json)
