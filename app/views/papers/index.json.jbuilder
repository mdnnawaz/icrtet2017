json.array!(@papers) do |paper|
  json.extract! paper, :id, :paper_tile, :abstract, :type_of_conference
  json.url paper_url(paper, format: :json)
end
