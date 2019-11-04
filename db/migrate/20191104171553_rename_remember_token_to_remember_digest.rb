class RenameRememberTokenToRememberDigest < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :remember_token, :remember_digest
  end
end
