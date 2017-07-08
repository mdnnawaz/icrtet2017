json.array!(@journals) do |journal|
  json.extract! journal, :id, :annexure_1, :annexure_2, :others, :user_id
  json.url journal_url(journal, format: :json)
end
