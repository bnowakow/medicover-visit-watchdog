class AddUsernameAndPasswordToMedicoverApis < ActiveRecord::Migration
  def change
    add_column :medicover_apis, :username, :string
    add_column :medicover_apis, :password, :string
  end
end
