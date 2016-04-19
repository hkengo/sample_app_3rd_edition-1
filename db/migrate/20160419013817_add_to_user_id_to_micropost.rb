class AddToUserIdToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :to_user_id, :string, default: nil
  end
end
