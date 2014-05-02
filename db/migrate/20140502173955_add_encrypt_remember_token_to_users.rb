class AddEncryptRememberTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :encrypt_remember_token, :string
    add_index :users, :encrypt_remember_token
  end
end
