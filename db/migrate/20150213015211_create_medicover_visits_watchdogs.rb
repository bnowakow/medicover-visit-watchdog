class CreateMedicoverVisitsWatchdogs < ActiveRecord::Migration
  def change
    create_table :medicover_visits_watchdogs do |t|
      t.references :medicover_visit_query, index: true
      t.datetime :first_possible_appointment_date

      t.timestamps null: false
    end
    add_foreign_key :medicover_visits_watchdogs, :medicover_visit_queries
  end
end
