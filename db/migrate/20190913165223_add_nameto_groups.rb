class AddNametoGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :name, :string
  end
end
