class AddRefreshTokenPathToMedicoverApis < ActiveRecord::Migration
  def change
    add_column :medicover_apis, :refresh_token_path, :string
  end
end
