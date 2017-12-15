json.extract! document, :id, :title, :content, :file, :created_at, :updated_at
json.url document_url(document, format: :json)
