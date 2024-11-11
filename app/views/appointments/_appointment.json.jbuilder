json.extract! appointment, :id, :user_id, :animal_id, :observacao, :aberto, :created_at, :updated_at
json.url appointment_url(appointment, format: :json)
