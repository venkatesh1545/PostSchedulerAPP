class CreateLinkedinAccounts < ActiveRecord::Migration[7.0]
  def change
    create_table :linkedin_accounts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :access_token
      t.string :refresh_token
      t.timestamps
    end
  end
end