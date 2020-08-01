json.extract! teacher, :id, :name, :email, :phone, :subject_id, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
