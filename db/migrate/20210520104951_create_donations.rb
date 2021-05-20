class CreateDonations < ActiveRecord::Migration[6.1]
  def change
    create_table :donations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :charity, null: false, foreign_key: true

      t.timestamps
    end
    add_foreign_key :donations, :users, column: :user_id
    add_foreign_key :donations, :charities, column: :charity_id
  end
end
