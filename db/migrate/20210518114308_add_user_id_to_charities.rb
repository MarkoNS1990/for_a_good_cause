class AddUserIdToCharities < ActiveRecord::Migration[6.1]
  def change
    add_column :charities, :user_id, :integer
  end
end
