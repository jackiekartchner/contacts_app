class RemoveFamfromGroups < ActiveRecord::Migration[6.0]
  def change
    remove_column :groups, :family, :string
  end
end
