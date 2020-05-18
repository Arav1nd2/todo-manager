class RemoveUserIdFromUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :todos, :user_id, :integer
    remove_column :users, :user_id
  end
end
