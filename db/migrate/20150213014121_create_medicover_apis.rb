class CreateMedicoverApis < ActiveRecord::Migration
  def change
    create_table :medicover_apis do |t|
      t.string :url
      t.text :token
      t.string :new_visit_path

      t.timestamps null: false
    end
  end
end
