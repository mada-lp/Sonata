json.partial! "documents/document", document: @document
json.extract! @document, :id, :title, :content, :file, :created_at, :updated_at
