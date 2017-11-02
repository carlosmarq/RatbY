json.extract! server, :id, :hostname, :description, :created_at, :updated_at
json.url server_url(server, format: :json)
