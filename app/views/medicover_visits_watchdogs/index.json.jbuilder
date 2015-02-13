json.array!(@medicover_visits_watchdogs) do |medicover_visits_watchdog|
  json.extract! medicover_visits_watchdog, :id, :medicover_visit_query_id, :first_possible_appointment_date
  json.url medicover_visits_watchdog_url(medicover_visits_watchdog, format: :json)
end
