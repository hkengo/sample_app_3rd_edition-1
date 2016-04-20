class AddToMicropostIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :to_micropost_id, :integer, default: nil
  end
end
