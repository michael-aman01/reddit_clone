class RemoveColFromSubs < ActiveRecord::Migration[7.0]
  def change
    remove_column :subs, :moderator

  end
end
