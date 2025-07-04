class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :encrypted_password, null: false, default: "" unless column_exists?(:users, :encrypted_password)
      t.string :reset_password_token unless column_exists?(:users, :reset_password_token)
      t.datetime :reset_password_sent_at unless column_exists?(:users, :reset_password_sent_at)
      t.datetime :remember_created_at unless column_exists?(:users, :remember_created_at)
    end
    add_index :users, :reset_password_token, unique: true unless index_exists?(:users, :reset_password_token)
  end

  def column_exists?(table_name, column_name)
    ActiveRecord::Base.connection.column_exists?(table_name, column_name)
  end

  def index_exists?(table_name, column_name)
    ActiveRecord::Base.connection.index_exists?(table_name, column_name)
  end
end 