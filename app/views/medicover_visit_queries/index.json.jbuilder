json.array!(@medicover_visit_queries) do |medicover_visit_query|
  json.extract! medicover_visit_query, :id, :region, :booking_type, :specialization, :clinic, :language, :doctor, :search_since, :search_for_next_since, :period_of_the_day, :set_because_of_pcc, :is_set_because_promote_specialization
  json.url medicover_visit_query_url(medicover_visit_query, format: :json)
end
