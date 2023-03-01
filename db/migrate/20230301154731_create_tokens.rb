class CreateTokens < ActiveRecord::Migration[7.0]
  def change
    create_table :tokens do |t|
      t.string :token, null: false, index: true
      t.string :refresh_token, null: false, index: true
      t.datetime :expires_at

      t.timestamps
    end
  end
end
