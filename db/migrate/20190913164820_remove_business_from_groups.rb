class RemoveBusinessFromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :business, :string
  end
end
