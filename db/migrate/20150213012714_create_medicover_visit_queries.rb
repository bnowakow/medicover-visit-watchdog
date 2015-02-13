class CreateMedicoverVisitQueries < ActiveRecord::Migration
  def change
    create_table :medicover_visit_queries do |t|
      t.integer :region
      t.integer :booking_type
      t.integer :specialization
      t.integer :clinic
      t.integer :language
      t.integer :doctor
      t.datetime :search_since
      t.datetime :search_for_next_since
      t.integer :period_of_the_day
      t.boolean :set_because_of_pcc
      t.boolean :is_set_because_promote_specialization

      t.timestamps null: false
    end
  end
end
