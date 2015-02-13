json.array!(@medicover_apis) do |medicover_api|
  json.extract! medicover_api, :id, :url, :token, :new_visit_path
  json.url medicover_api_url(medicover_api, format: :json)
end
