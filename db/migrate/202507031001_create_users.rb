class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :encrypted_password, null: false, default: ""
      t.string :provider
      t.string :uid
      t.string :name
      t.string :access_token
      t.timestamps
    end
  end
end